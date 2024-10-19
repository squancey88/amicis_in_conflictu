Rails.application.routes.draw do
  get "login", to: "auth#login", as: :login
  get "invite", to: "auth#invite", as: :invite
  get "forgot_password", to: "auth#forgot_password", as: :forgot_password
  post "logout", to: "auth#logout", as: :logout
  post "auth/authenticate"
  post "auth/complete_invite"
  post "auth/reset_password"

  resources :armies do
    resources :army_lists
  end
  resources :teams
  resources :teams, only: %i[create update destroy]
  resources :game_systems, only: %i[index]
  namespace :game_systems do
    resources :wargames, except: %i[index]
  end
  resources :games
  resources :gaming_sessions, except: %i[index]
  resources :players, only: %i[update]
  resources :gaming_groups do
    member do
      post :update_membership
      post :remove_user
      post :invite_user
    end
  end
  resources :users, only: %i[show update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#homepage"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
