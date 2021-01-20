Rails.application.routes.draw do
  resources :users do 
    resources :recommendations, only: [:show,:index,:new]
  end
  resources :recommendations 
  resources :channels, only: [:show]
  root to: 'static#home'
  match '/auth/twitch/callback', to: 'sessions#twitch_login', via: [:get, :post] 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
