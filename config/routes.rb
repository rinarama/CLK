Rails.application.routes.draw do
  resources :user, only: [:new, :create, :show]
  resources :comment
  resources :post
  resources :like, only: [:create, :destroy]
  resources :friendship, only: [:create, :destroy]
  resources :request, only: [:create, :destroy]

  post "/users/login", to: "user#login"
  delete "/users/logout", to: "user#logout"
end
