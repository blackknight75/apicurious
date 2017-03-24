Rails.application.routes.draw do

  root 'home#index'
  get 'auth/github/callback', to: 'sessions#create'
  get 'logout',               to: 'sessions#destroy'
  get 'repos',                to: 'repos#index'
  get 'followers',            to: 'followers#index'
  get 'following',            to: 'following#index'
  get 'starred',              to: 'starred#index'
  get 'received_events',      to: 'following_events#index'
  resources :dashboard, only: [:index]
end
