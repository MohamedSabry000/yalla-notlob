Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define route for groups
  resources :groups do
    resources :group_friends
  end

  # Defines the root path route ("/")
  root 'pages#myaccount'
end
