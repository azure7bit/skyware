class GeneralPagesController < ApplicationController
  layout 'website'  
  def index
    render 'general_pages/index'
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

  def save_post
    @post = Blogit::Post.new(post_params.merge({:blogger_id => current_user.id, :blogger_type => current_user.class.to_s}))
    @post.save
    # redirect_to root_url(subdomain: current_user.subdomain)
    redirect_to :back
  end

  def destroy_post
    # @post = Blogit::Post.where(params[:id], :blogger_id => current_user.id, :blogger_type => current_user.class.to_s)
    @post = Blogit::Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :tag_list)
    end
  
end