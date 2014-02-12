class WWWSubdomain
  def matches?(request)
    request.subdomain.present? and (request.subdomain == 'www')
  end
end

class Subdomain
  def matches?(request)
    request.subdomain.present? and (request.subdomain != 'www')
  end
end

SkyhqNew::Application.routes.draw do

  authenticated :citizen do
    root to: 'company_profiles#index'
  end


  authenticated :super_admin do
    root :to => 'Locations#index'
  end
  
  constraints(WWWSubdomain.new) do
    root :to => 'general_pages#index'
  end

  constraints(Subdomain.new) do
    root to: Blogit::Engine
  end
  root :to => 'general_pages#index'

  match '/home' => 'general_pages#index'
  match '/about' => 'general_pages#about'
  match '/contact' => 'general_pages#contact'
  match '/faq' => 'general_pages#faq'
  match '/testimonials' => 'general_pages#testimonials'
  match '/pricing' => 'general_pages#pricing'
  match '/services' => 'general_pages#services'
  match '/tos' => 'general_pages#tos'
  match '/edit_citizen_password' => 'blogit/posts#edit_citizen_password'
  match '/save_citizen_password' => 'blogit/posts#save_citizen_password'
  match '/blog' => 'blogit/posts#index'

  
  # post '/update_citizen_password' => 'blogit/posts#update_citizen_password'
  
  # match '/profile' => "company_profiles#admin_profile", :as => "admin_profile"
  # delete "/businesses/:business_id/managers/:id/delete", to: "managers#destroy", :as => "remove_manager"


  resources :company_forums, :path => "comms" do
    resources :company_forum_topics do
      resources :forum_posts
    end
  end
  resources :company_docs, path: 'docs'

  resources :company_profiles, :path => "public"
  
  resources :online_stores, :path => "orders" do
    resources :products
  end

  resources :categories, :path => "categories"

  resources :business_messengers, :path => "messengers"

  resources :locations do
    resources :managers 
    resources :employees
  end
  

  devise_for :citizens, :controllers => { 
    :omniauth_callbacks => "citizens/omniauth_callbacks",
    registrations: 'citizens/registrations',

  }

  devise_for :super_admins, controllers: { 
    registrations: 'super_admins/registrations'
  }

  
  devise_scope :super_admin do
    get "login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
    get "reset",    to: "devise/passwords#new"
    get "profile", to: "devise/registrations#edit"
  end

  devise_scope :citizen do
    get "user/login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "user/register", to: "devise/registrations#new"
    get "user/reset",    to: "devise/passwords#new"
    get "user/profile", to: "devise/registrations#edit"
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
