Rails.application.routes.draw do
  resources :customers do
    resources :orders, only: [:index, :create]
  end

  resources :orders, only: [:update, :destroy, :show]
end
