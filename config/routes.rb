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
    get '/' => 'blogit/posts#index'
  end


  authenticated :super_admin do
    get '/' => 'blogit/posts#index'
  end
  
  constraints(WWWSubdomain.new) do
    get '/' => 'general_pages#index'
  end

  constraints(Subdomain.new) do
    get '/' => Blogit::Engine
      # post "", to: "company_profiles#edit_post", as: "company_edit_post"
  end
  
  root :to => 'general_pages#index'

  match   "/post/save" => 'general_pages#save_post', :via => :post
  post    "public/:id/tagline/", to: "company_profiles#save_tagline", as: "company_tagline"
  patch   "public/:id/edit/", to: "company_profiles#edit_post", as: "company_edit_post"
  delete  "public/:id", to: "general_pages#destroy_post", as: "delete_post"
  get "public", to: "blogit/posts#index"

  get  '/home' => 'general_pages#index'
  get  '/about' => 'general_pages#about'
  get  '/contact' => 'general_pages#contact'
  get  '/faq' => 'general_pages#faq'
  get  '/testimonials' => 'general_pages#testimonials'
  get  '/pricing' => 'general_pages#pricing'
  get  '/services' => 'general_pages#services'
  get  '/tos' => 'general_pages#tos'
  post '/check-email' => 'general_pages#check_email'
  post '/check-subdomain' => 'general_pages#check_subdomain'
  get  '/edit_citizen_password' => 'blogit/posts#edit_citizen_password'
  post '/save_citizen_password' => 'blogit/posts#save_citizen_password'
  get  '/blog' => 'blogit/posts#index'

  # post '/update_citizen_password' => 'blogit/posts#update_citizen_password'
  
  # match '/profile' => "company_profiles#admin_profile", :as => "admin_profile"
  # delete "/businesses/:business_id/managers/:id/delete", to: "managers#destroy", :as => "remove_manager"


  resources :company_forums, :path => "comms" do
    resources :company_forum_topics do
      resources :forum_posts
    end
  end
  resources :company_docs, path: 'docs'

  resources :company_profiles

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
    get "business/login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "business/register", to: "devise/registrations#new"
    get "business/reset",    to: "devise/passwords#new"
    get "business/profile", to: "devise/registrations#edit"
  end

  devise_scope :citizen do
    get "login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
    get "reset",    to: "devise/passwords#new"
    get "profile", to: "devise/registrations#edit"
  end
  
  get("/inbox/new/:super_admin_id", { :controller => "conversations", :action => 'new', :as => 'message_company'})
  
  resources :conversations, :path => "inbox", only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end
