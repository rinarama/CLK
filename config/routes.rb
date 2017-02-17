Rails.application.routes.draw do
  resources :user, only: [:new, :create, :show]
  resources :comment
  resources :post
  resources :like, only: [:create, :destroy]
  resources :friendship, only: [:create, :destroy]
  resources :request, only: [:create, :destroy]
end
