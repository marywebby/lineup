Rails.application.routes.draw do
  root to: "home#index"
  
  resources :product_ingredients
  resources :products
  resources :routine_products
  resources :routines do
    resources :messages
  end
  devise_for :users

  post("/generate_routine", { :controller => "messages", :action => "create" })

  get "/generate_routine" => "routines#new", as: :current_user_generate_routine

  get "/products" => "products#index", as: :browse_products

  get "/about" => "home#about", as: :about_lineup
end
