Rails.application.routes.draw do
  devise_for :users
 root "items#index"
resources :items
resources :users, only: :create
resources :orders, only: :create
end
