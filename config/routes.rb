Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "health", to: "application#health"

  constraints format: :json do
    namespace :api do
      namespace :v1 do
        resources :categories, only: %i[index show]
        resources :customers, only: %i[index create] do
          resources :carts, only: %i[create destroy]
          get 'cart', to: 'carts#show'

          resources :cart_items, only: %i[index create update destroy]
          resources :customer_orders, only: %i[index show create update]
        end
        resources :deliveries, only: %i[index create update] do
          resources :delivery_items, only: %i[index create update destroy]
        end
        resources :drivers, only: %i[index show]
        resources :funds, only: %i[index show create update destroy]
        resources :products, only: %i[index show create update destroy]
        resources :storages, only: %i[index] do # Different API
          resources :product_availabilities, only: %i[index]
        end
      end
    end
  end
end
