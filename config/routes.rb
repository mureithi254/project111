Rails.application.routes.draw do
  
  root 'home#index'
  get 'dispatch/index'
  
  resources :admins do
     member do
        get :delete
     end
  end
  resources :staffs do
     member do
        get :delete
     end
  end
  resources :emergencies
  resources :clients
  resources :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
