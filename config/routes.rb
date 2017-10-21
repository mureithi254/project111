Rails.application.routes.draw do
  
  root 'home#index'
  get 'dispatch/index'

  #admin specific routes
  get 'admin/attempt_login'
  get 'admin/logout'
  get 'admin/login'

  #staff specific routes
  get 'staff/attempt_login'
  get 'staff/logout'
  get 'staff/login'

  

  
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
