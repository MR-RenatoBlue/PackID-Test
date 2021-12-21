Rails.application.routes.draw do
  resources :categories
  resources :products
  devise_for :users
  root to: "welcome#index"
end
