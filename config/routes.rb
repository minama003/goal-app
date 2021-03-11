Rails.application.routes.draw do
  devise_for :users
  root to: 'goals#index'
  post "lists/new" => "lists#create"
  resources :users, only: [:show]
  resources :goals, only: [:index,:new,:create,:destroy]
  resources :lists, only: [:index, :new, :create,:destroy]
end
