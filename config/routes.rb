Rails.application.routes.draw do
  #devise_for :controllers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "posts#index"

  # resources :users 
  resources :posts
  resources :users
end
