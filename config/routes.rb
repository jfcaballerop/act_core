Rails.application.routes.draw do
  resources :act_cons_ords
  resources :roles
  post 'authenticate', to: 'authentication#authenticate'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
