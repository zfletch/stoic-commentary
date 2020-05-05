Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resource :user, only: [:edit, :update], path: :account

  resources :references, only: [:index, :show], param: :ref do
    resources :comments, only: [:index, :new, :create]
  end
  resources :editions, only: [:show]
  resources :comments, only: [:destroy]
  resources :password_resets, only: [:new, :create, :show], param: :token

  resource :about, only: [:show]

  root 'references#index'
end
