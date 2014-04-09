PhotoShare::Application.routes.draw do
  root to: 'photos#index'

  resources :users
  resources :photos
  resources :sessions, only: [:new, :create, :destroy]

end
