class UsersController < ApplicationController
  before_action :set_user, only: %i(edit update destroy)
  before_action :add_index_breadcrumb, only: %i(new edit)

  def index
    @users = User.order(:id).paginate(page: params[:page], per_page: 25)
  end

  def new
    @user = User.new
    @number = sprintf('%08d', rand(99999999))
    add_breadcrumb('新規会員登録')
  end

  def edit
    add_breadcrumb(@user.name, @todo)
    add_breadcrumb('会員情報')
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "会員を登録しました."
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to action: :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "会員情報を更新しました。", status: :see_other
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to action: :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "会員をアーカイブしました。", status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :image,
      :name,
      :name_reading,
      :phone_number,
      :number,
      :birth_day,
      :gender,
      :postal_code,
      :prefecture,
      :city,
      :address,
      :building,
      :stripe_customer_id,
      :status,
      :student,
      :parent
    )
  end

  def add_index_breadcrumb
    add_breadcrumb('会員一覧', users_path)
  end
end
