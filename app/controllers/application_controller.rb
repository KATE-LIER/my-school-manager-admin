class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  private

  def add_breadcrumb(label, path = nil)
    @breadcrumbs << {
      label: label,
      path: path
    }
  end

  # パンくずリストの初期化
  def set_breadcrumbs
    @breadcrumbs = []
  end
end
