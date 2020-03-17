Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :user, only: [:edit, :update]

  resources :references, only: [:index, :show]
  resources :editions, only: [:show]

  root 'references#index'
end
