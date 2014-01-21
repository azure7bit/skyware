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
  
end