Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   # Defines the root path route ("/")
   root 'pages#myaccount'

   # Orders
   get "/orders/index", to: "orders#index"
   get "/orders/new", to: "orders#new"
 
   post "/orders/new", to: "orders#create"
 
 
end
