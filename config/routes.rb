Rails.application.routes.draw do
  # devise_for :users

  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  #   get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  #  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # authenticated :user do
  #   root 'home#index', as: 'authenticated_root'
  # end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end
  
  resources :friends

  resources :notifications
  
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
