Rails.application.routes.draw do
  resources :users do 
    resources :recommendations, only: [:show,:index,:new,:edit,:create,:update,:destroy]
  end
  resources :recommendations, only: [:show,:index,]
  resources :channels, only: [:show]
  root to: 'static#home'
  match '/auth/twitch/callback', to: 'sessions#twitch_login', via: [:get, :post] 
  get 'login', to: 'sessions#new'
  get 'login_twitch', to: 'sessions#new_twitch'
  post 'login', to: 'sessions#create'
  match 'logout', to: 'sessions#destroy', via: [:get, :post]
end
