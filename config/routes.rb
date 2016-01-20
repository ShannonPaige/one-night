Rails.application.routes.draw do
  root 'welcome#index'

  resources :locations,         only: [:index, :show]
  resources :favorites,         only: [:index, :create]
  resources :api,              only: [:index]
  get 'auth/twitter',                                   as: :login
  get 'auth/twitter/callback',  to: 'sessions#create'
  get 'logout',                 to: 'sessions#destroy', as: :logout
  get 'profile',                to: 'users#show'
  get 'search',                 to: "search#index"
end
