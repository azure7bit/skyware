SkyhqNew::Application.routes.draw do

  authenticated :super_admin do
    root :to => 'Businesses#index'
  end
  root :to => 'general_pages#index'

  match '/home' => 'general_pages#index'
  match '/about' => 'general_pages#about'
  match '/contact' => 'general_pages#contact'
  match '/faq' => 'general_pages#faq'
  match '/testimonials' => 'general_pages#testimonials'
  match '/pricing' => 'general_pages#pricing'
  match '/services' => 'general_pages#services'
  match '/terms-of-service' => 'general_pages#tos'
  match '/profile' => "company_profiles#admin_profile", :as => "admin_profile"
  # delete "/businesses/:business_id/managers/:id/delete", to: "managers#destroy", :as => "remove_manager"


  resources :company_forums, :path => "comms" do
    resources :company_forum_topics do
      resources :forum_posts
    end
    resources :company_docs
  end

  resources :company_profiles, :path => "public"
  
  resources :online_stores, :path => "orders" do
    resources :products
  end

  resources :categories, :path => "categories"

  resources :business_messengers, :path => "messengers"

  resources :businesses, :path => "locations" do
    resources :managers 
    resources :employees
  end


  devise_for :super_admins, :controllers => { :omniauth_callbacks => "super_admins/omniauth_callbacks" } 

  devise_scope :super_admin do
    get "login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
  end
  
  get("/inbox/new/:super_admin_id", { :controller => "Conversations", :action => 'new', :as => 'message_company'})
  
  resources :conversations, :path => "inbox", only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
