Rails.application.routes.draw do
  
  root 'public#public_page'

  get 'home',:to => 'home#index',:as => '/home'
  get 'login' ,:to => 'home#login',:as =>'/login'
  get 'logout',:to => 'home#logout',:as => '/logout'
  post 'home/attempt_login'
  get 'dispatch/index'

  #admin specific routes
  post 'admins/attempt_login'
  get 'admins/logout'
  get 'admin',:to => 'admins#login',:as => '/admin'
  get 'admins/admin_menu'

  #staff specific routes
 post 'staffs/attempt_login'
  get 'staffs/logout'
  get 'staffs/login'

  #super_admin specific routes
  post 'super_admins/attempt_login'
  get 'super_admins/login'
  get 'super_admins/logout'
  get 'super_admins/super_admins_menu'




  
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
  resources :super_admins do
     member do
        get :delete
     end
  end
  resources :emergencies
  resources :clients
  resources :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
