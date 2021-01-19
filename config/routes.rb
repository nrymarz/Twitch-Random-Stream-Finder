Rails.application.routes.draw do
  root to: 'static#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 
end
