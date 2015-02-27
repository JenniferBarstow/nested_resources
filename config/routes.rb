Rails.application.routes.draw do
  resources :companies do
  resources :events
end
end
