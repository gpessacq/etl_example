Rails.application.routes.draw do
  resources :units
  match '/extract_units'  => 'units#extract_units', :as => :extract_units,  :via => [:get]
  root 'units#index'
end
