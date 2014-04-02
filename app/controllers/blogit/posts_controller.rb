module Blogit

  # Using explicit ::Blogit::ApplicationController fixes NoMethodError 'blogit_authenticate' in
  # the main_app
  class PostsController < ::Blogit::ApplicationController
       
    # If using Blogit's Create, Update and Destroy actions AND ping_search_engines is
    # set, call ping_search_engines after these requests
    if Blogit.configuration.include_admin_actions
      after_filter :ping_search_engines, only: [:create, :update, :destroy], :if => lambda { Blogit.configuration.ping_search_engines }
    end
    
    # Raise a 404 error if the admin actions aren't to be included
    # We can't use blogit_conf here because it sometimes raises NoMethodError in main app's routes
    unless Blogit.configuration.include_admin_actions
      before_filter :raise_404, except: [:index, :show, :tagged]
    end

    blogit_authenticate(except: [:index, :show, :tagged])

    def index    
      subdomain = request.subdomain
      @user = Citizen.where(subdomain: subdomain).first
      @user ||= SuperAdmin.where(subdomain: subdomain).first
      @user ||= User.find_by(:subdomain => subdomain)

      respond_to do |format|
        format.xml {
          @posts = Post.order('created_at DESC')
        }
        format.html {
          @posts = Post.where(blogger: @user, :post_type => nil).for_index(params[Kaminari.config.param_name])
          @sticky_posts = Post.where(blogger: @user, :post_type => "Sticky").for_index(params[Kaminari.config.param_name]).per(2)
          render :index, layout: current_user ? 'application' : 'blog'
        }
        format.rss {
          @posts = Post.order('created_at DESC')
        }
      end
    end

    def edit_citizen_password
      subdomain = request.subdomain
      @resource = Citizen.where(subdomain: subdomain).first
      @user = current_citizen
    end
    def save_citizen_password
      if  params[:citizen][:password] ==  params[:citizen][:password_confirmation]
        current_user.password = params[:citizen][:password]
        current_user.password_confirmation = params[:citizen][:password_confirmation]
        current_user.save
        if  current_user.save
         flash[:notice] = "Password change successfully"
         redirect_to blog_root_path
       else
          flash[:notice] = "There is some problem please try again"
          redirect_to :back
       end
      else
         flash[:notice] = "Password and Password confirmation did not match"
         redirect_to :back
       end
    end

    def show
      @post = Post.find(params[:id])
    end

    def tagged
      @posts = Post.for_index(params[Kaminari.config.param_name]).tagged_with(params[:tag])
      render :index
    end

    def new
      @post = current_blogger.blog_posts.new(post_paramters)
    end

    def edit
      @post = current_blogger.blog_posts.find(params[:id])
    end

    def create
      @post = current_blogger.blog_posts.new(post_paramters)
      if @post.save
        redirect_to @post, notice: t(:blog_post_was_successfully_created, scope: 'blogit.posts')
      else
        render action: "new"
      end
    end

    def update
      @post = current_blogger.blog_posts.find(params[:id])
      if @post.update_attributes(post_paramters)
        redirect_to @post, notice: t(:blog_post_was_successfully_updated, scope: 'blogit.posts')
      else
        render action: "edit"
      end
    end

    def destroy
      @post = current_blogger.blog_posts.find(params[:id])
      @post.destroy
      redirect_to posts_url, notice: t(:blog_post_was_successfully_destroyed, scope: 'blogit.posts')
    end
    
    def post_paramters
      if params[:post]
        params[:post]
        # params.require(:post).permit(:title, :body, :tag_list)
      else
        {}
      end
    end

    private

    def raise_404
      # Don't include admin actions if include_admin_actions is false
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    end
    
    
    # @See the Pingr gem for more info https://github.com/KatanaCode/pingr
    def ping_search_engines
      case blogit_conf.ping_search_engines
      when Array
        search_engines = blogit_conf.ping_search_engines
      when true
        search_engines = Pingr::SUPPORTED_SEARCH_ENGINES
      end
      for search_engine in search_engines
        Pingr::Request.new(search_engine, posts_url(format: :xml)).ping
      end
    end

  end

end
