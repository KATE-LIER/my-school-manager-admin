Rails.application.routes.draw do
  scope "admin/manager" do
    resources :dashboards, only: %i(index)
    resources :users, only: %i(index new create edit update destroy)
  end
end
