Rails.application.routes.draw do
  # get 'items#index'
 root to: "items#index"
resources :tweets, only: :index
end
