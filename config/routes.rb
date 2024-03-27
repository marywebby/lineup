Rails.application.routes.draw do
  root to: "routines#index"
  
  resources :product_ingredients
  resources :products
  resources :routine_products
  resources :routines
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
