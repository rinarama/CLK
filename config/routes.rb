Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :comments
  resources :posts
  resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :requests, only: [:create, :destroy]

  post "/users/login", to: "users#login"
  delete "/users/logout", to: "users#logout"
  root "users#new"
end
