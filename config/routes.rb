Rails.application.routes.draw do
  resources :users
  resources :texts
  resources :passages do
    resources :comments
  end

  root 'passages#index'
end
