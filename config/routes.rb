SkyhqNew::Application.routes.draw do

  match '/home' => 'websites#home'
  match '/about' => 'general_pages#about'
  match '/contact' => 'general_pages#contact'
  match '/faq' => 'general_pages#faq'
  match '/testimonials' => 'general_pages#testimonials'
  match '/pricing' => 'general_pages#pricing'
  match '/services' => 'general_pages#services'
  match '/terms-of-service' => 'general_pages#tos'
  match '/admin_profile/:super_admin_id' => "company_profiles#admin_profile", :as => "admin_profile"
  # delete "/businesses/:business_id/managers/:id/delete", to: "managers#destroy", :as => "remove_manager"


  resources :company_forums do
    resources :company_forum_topics do
      resources :forum_posts
    end
    resources :company_docs
  end

  resources :company_profiles
  
  resources :online_stores do
    resources :products
  end


  resources :categories

  resources :business_messengers

  resources :businesses do
    resources :managers 
    resources :employees
  end

#  authenticated :super_admin do
#    root :to => 'Websites#index'
#  end
  
  root :to => 'Websites#home'

  devise_for :super_admins, :controllers => { :omniauth_callbacks => "super_admins/omniauth_callbacks" } 

  devise_scope :super_admin do
    get "login",    to: "devise/sessions#new"
    get "logout",   to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
  end
  
  get '/index' => 'Websites#index', :match => 'index'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  get("/conversations/new/:super_admin_id", { :controller => "Conversations", :action => 'new', :as => 'message_company'})
  
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
