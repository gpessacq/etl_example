Rails.application.routes.draw do
  resources :units
  root 'units#index'
end
