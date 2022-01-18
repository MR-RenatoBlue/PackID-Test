Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :categories
  resources :products
  devise_for :users
  resources :users, except: [:new, :create]
  root to: "welcome#index"
end
