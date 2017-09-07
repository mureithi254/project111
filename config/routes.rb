Rails.application.routes.draw do
  get 'map/home'

  resources :emergencies
  resources :clients
  resources :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
