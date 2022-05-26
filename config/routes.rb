Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
   get "/friends/search", to: "friends#search"
  resources :friends
  get "/friends/index", to: "friends#index"
   delete "/friends/:id", to: "friends#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


   # Orders
  #  get "/orders/index", to: "orders#index"
  #  get "/orders/new", to: "orders#new"
  post "/orders/new", to: "orders#create"

  resources :orders do
    resources :order_partispants
    member do
      patch :change_status_to_completed
      patch  :change_status_to_canceled
    end

    collection do
      patch 'change_status_to_completed'
    end

    collection do
      get 'addFriendtoOrder'
    end
    collection do
      get 'addGrouptoOrder'
    end
    collection do
      get 'order_friend_params'
    end
  end
  # Define route for groups
  resources :groups do
    resources :group_friends
  end

  # Defines the root path route ("/")
  root 'pages#myaccount'




end