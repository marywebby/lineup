Rails.application.routes.draw do
  root to: "home#index"
  
  resources :product_ingredients
  resources :products
  resources :routine_products
  resources :routines
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/generate_routine" => "routines#new", as: :current_user_generate_routine

  get "/products" => "products#index", as: :browse_products
end
