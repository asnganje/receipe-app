Rails.application.routes.draw do
  resources :shopping_list, only: [ :new ]
  post "shopping_lists/generate", to: "shopping_lists#generate", as: :generate_shopping_list
  resources :recipes do
    resources :recipe_foods
  end
  resources :inventories do
    resources :inventory_foods
  end
  resources :foods
  resources :dashboard, only: [ :index ]
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
end
