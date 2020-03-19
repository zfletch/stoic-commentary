Rails.application.routes.draw do
  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resource :user, only: [:edit, :update], path: :account

  resources :references, only: [:index, :show], param: :ref do
    resources :comments, only: [:index, :new, :create]
  end
  resources :editions, only: [:show]
  resources :password_resets, only: [:new, :create, :show], param: :token

  root 'references#index'
end
