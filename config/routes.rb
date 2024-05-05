Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords'
}

      
  namespace :admin do
    resources :posts
    resources :users
  end
  resources :profiles
  resources :users
  resources :parties
  post 'follow/:id', to: 'follows#follow', as: :follow
  post 'unfollow/:id', to: 'follows#unfollow', as: :unfollow
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  # config/routes.rb
  resources :parties do
    member do
      patch :increment_interest
    end
  end


  authenticated :admin_user do 
    root to: "admin#index", as: :admin_root

  end
  

  get "admin" => "admin#index"
end
