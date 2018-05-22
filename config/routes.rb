Rails.application.routes.draw do
  resources :roles
  post 'authenticate', to: 'authentication#authenticate'
  
  resources :cons_ords
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
