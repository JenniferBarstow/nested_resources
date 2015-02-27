Rails.application.routes.draw do
  root 'companies#index'

  resources :companies do
  resources :events
end
end
