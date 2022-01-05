Rails.application.routes.draw do
  resources :categories
  resources :products
  devise_for :users
  resources :users, except: [:new, :create]
  root to: "welcome#index"
end
