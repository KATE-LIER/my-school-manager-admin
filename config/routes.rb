Rails.application.routes.draw do
  scope "admin/manager" do
    resources :dashboards, only: %i(index)
  end
end
