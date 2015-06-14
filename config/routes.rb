Rails.application.routes.draw do
  
  root to:'home#index'

  resource :user
  resources :users
end
