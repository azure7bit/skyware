Skywyre::Application.routes.draw do

  # Devise for local Authentication
  devise_for :users, path_names: {sign_up: 'register', sign_in: 'login', sign_out: 'logout' }

  devise_scope :user do
    get "login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
  end

  match '/users/check', to: 'users#check'

  resources :users

  # Oauth
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure",            to: "sessions#failure"
  match "/logout",                  to: "sessions#destroy", :as => "logout"

  # Public pages
  match 'about'   => 'home#about',   as: :about
  match 'contact' => 'home#contact', as: :contact
  match 'privacy' => 'home#privacy', as: :privacy
  match 'terms'   => 'home#terms',   as: :terms

  # Sample Question for testing view/UI
  match 'test' => 'home#test', as: :test

  root to: 'home#index'
end
