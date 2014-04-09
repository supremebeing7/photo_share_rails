PhotoShare::Application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'photos#index'

  resources :users
  resources :photos
  resources :sessions, only: [:new, :create, :destroy]

end
