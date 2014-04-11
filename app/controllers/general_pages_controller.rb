class GeneralPagesController < ApplicationController
  layout 'website'  
  def index
    render 'general_pages/index'
  end

  def check_email
    if params[:citizen]
      user = Citizen.where(email: params[:citizen][:email]).first
      if user
        render json: nil
      else
        render json: true
      end
    elsif params[:super_admin]
    end
  end

  def check_subdomain
    if params[:citizen]
      user1 = Citizen.where(subdomain: params[:citizen][:subdomain]).first
      user2 = SuperAdmin.where(subdomain: params[:citizen][:subdomain]).first
      if (user1 or user2)
        render json: nil
      else
        render json: true
      end
    elsif params[:super_admin]
    end
  end
  
  def about
    render 'general_pages/about'
  end
  
  def contact
    render 'general_pages/contact'
  end
  
  def faq
    render 'general_pages/faq'
  end
  
  def testimonials
    render 'general_pages/testimonials'
  end
  
  def pricing
    render 'general_pages/pricing'
  end
  
  def services
    render 'general_pages/services'
  end
  
  def tos
    render 'general_pages/tos'
  end

  def edit_post
    @post = Blogit::Post.find_by(:id => params[:id])
    if params[:post][:post_type] == "0"
      params[:post][:post_type] = nil
    else
      params[:post][:post_type] = "Sticky"
    end
    @post.update_attributes(post_params.merge({:blogger_id => current_user.id, :blogger_type => current_user.class.to_s}))

    redirect_to :back
  end

  def save_post
    @post = Blogit::Post.new(post_params.merge({:blogger_id => current_user.id, :blogger_type => current_user.class.to_s}))
    @post.post_type = params[:post][:post_type] != "0" ? "Sticky" : nil    
    message =  @post.save ? "Post successfully created" : "Post failed created, topic or post content must be minimum 11 characters and maximum 66 characters"
    flash[:notice] = message
    redirect_to root_url(subdomain: current_user.subdomain)
  end

  def destroy_post
    # @post = Blogit::Post.where(params[:id], :blogger_id => current_user.id, :blogger_type => current_user.class.to_s)
    @post = Blogit::Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  def get_citizen
    to_users = Citizen.select(:subdomain)
    to_users ||= BusinessUser.where(:subdomain => current_user.subdomain)
    render :json => to_users.map{ |c| c.subdomain}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :tag_list, :post_type, :allow_comment)
    end
  
end