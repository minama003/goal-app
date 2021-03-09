Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:index, :show]
  resources :goals, only: [:new,:create,:show,:destroy]
end
