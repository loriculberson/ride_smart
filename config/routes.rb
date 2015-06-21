Rails.application.routes.draw do
  root 'home#index'
  
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  resource :user, only: [:show, :edit, :update]
  resources :users, only: [:new, :index, :create]
  resources :bike_events, only: [:index, :new, :create, :destroy]
end
