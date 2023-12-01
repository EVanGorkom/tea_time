Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :destroy, :index]
      resources :customers, only: [:create]
    end
  end
end
