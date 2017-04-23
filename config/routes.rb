Rails.application.routes.draw do
  default_url_options host: "http://localhost:3000"

  resources :customers do
    resources :orders, only: [:index, :create]
  end

  resources :orders, only: [:update, :destroy, :show] do
    resources :items, only: [:index, :create]
  end

  resources :items, only: [:update, :destroy, :show]
end
