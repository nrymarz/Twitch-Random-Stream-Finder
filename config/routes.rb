Rails.application.routes.draw do
  resources :users do 
    resources :recommendations, only: [:show,:index]
  end
  resources :recommendations 
  resources :channels, only: [:show]
  root to: 'static#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 
end
