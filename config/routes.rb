Rails.application.routes.draw do
  default_url_options host: "http://localhost:3000"

  scope path: '/api', defaults: { format: 'json' } do
    api_version(module: "Api::V1", header: { name: "Accept", value: "version=1" }, default: true) do
      resources :customers do
        resources :orders, only: [:index, :create]
      end

      resources :orders, only: [:update, :destroy, :show] do
        resources :items, only: [:index, :create]
      end

      resources :items, only: [:update, :destroy, :show]
    end

    api_version(module: "Api::V2", header: { name: "Accept", value: "version=2" }) do
      resources :customers, only: [:index, :show]
    end
  end
end
