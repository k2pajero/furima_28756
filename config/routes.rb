Rails.application.routes.draw do
  devise_for :users
 root "items#index"
 get 'orders', to: 'orders#index'
 resources :items do
  resources :orders, only: [:index,:create]
 end
resources :users, only: :create
end
