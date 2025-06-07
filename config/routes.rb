Rails.application.routes.draw do
  resources :recipes, only: [ :index ]
  resources :foods
  resources :dashboard, only: [ :index ]
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
end
