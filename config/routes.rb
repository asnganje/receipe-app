Rails.application.routes.draw do
  get "recipes/index"
  resources :dashboard, only: [ :index ]
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
end
