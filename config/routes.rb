Rails.application.routes.draw do
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
