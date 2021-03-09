Rails.application.routes.draw do
  devise_for :users
  root to: 'goals#index'
  resources :users, only: [:show]
  resources :goals, only: [:index,:new,:create,:destroy]
end
