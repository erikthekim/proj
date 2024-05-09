Rails.application.routes.draw do
  # Devise routes for users and admins using the same controllers
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_for :admins, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  # Admin namespace
  namespace :admin do
    resources :posts
    resources :users
    resources :reports, only: [:index, :show, :destroy]
    resources :parties do
      member do
        patch :increment_interest
      end
    end
    # Direct admin root, simplifies the authenticated block below
  end

  # General Resources
  resources :profiles
  resources :users
  resources :parties do
    member do
      patch :increment_interest
      post 'upvote'
      post 'downvote'
    end
  end
  # config/routes.rb
  resources :reports


  
  # Follow and unfollow routes
  post 'follow/:id', to: 'follows#follow', as: :follow
  post 'unfollow/:id', to: 'follows#unfollow', as: :unfollow

  # Health check route
  get "up", to: "rails/health#show", as: :rails_health_check
  get 'users/:name', to: 'users#show', as: :user_profile

  # Root path
  root to: "home#index"

  # Authenticated block for admin redirect to admin dashboard
  authenticated :user, ->(user) { user.admin? } do
    get '/admin', to: "admin#index", as: :admin_root
  end

  # Redirects for compatibility or redirection logic
  get '/admin', to: redirect('/admins/sign_in')
  get '/admins/sign_in', to: redirect('/users/sign_in')
end
