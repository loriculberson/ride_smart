Rails.application.routes.draw do
  
  root to:'home#index'

  # get '/login',       to: 'sessions#new'
  # post '/login',      to: 'sessions#create'
  # delete '/logout',   to: 'sessions#destroy'

  resource :user, only: [:show, :edit, :update]
  resources :users, only: [:new, :index, :create]
end
