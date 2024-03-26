Rails.application.routes.draw do
  resources :product_ingredients
  resources :products
  resources :routine_products
  resources :routines
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "routines#index"
end
