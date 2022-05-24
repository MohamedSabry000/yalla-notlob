Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
   get "/friends/search", to: "friends#search"
  resources :friends
   delete "/friends/:id", to: "friends#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#myaccount'
end
