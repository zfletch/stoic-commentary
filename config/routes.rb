Rails.application.routes.draw do
  resource :sessions, only: [:create, :destroy]
  resources :users, only: [:new, :create]
  resource :user, only: [:edit, :update]

  resources :references, only: [:index, :show], param: :ref do
    resources :comments, only: [:index, :new, :create]
  end
  resources :editions, only: [:show]

  root 'references#index'
end
