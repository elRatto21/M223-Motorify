Rails.application.routes.draw do
  get "user_sessions/new"
  get "user_sessions/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root 'pages#index'

  resources :teams, only: [:show]

  resources :users, only: [:show, :new, :create, :update, :edit]

  resources :bikes

  resources :parts

  resources :services

  resources :user_sessions, only: [:new, :create, :destroy]

  namespace :manage do
    resources :teams
  end

  namespace :admin do
    resources :teams
    resources :users
  end

  # Bind better urls
  get '/login', to: 'user_sessions#new'
  get '/register', to: 'users#new'
  get '/logout', to: 'user_sessions#destroy'
  
  get '/profile', to: 'users#show'

end
