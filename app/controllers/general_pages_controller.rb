class GeneralPagesController < ApplicationController
  
  def about
    render 'general_pages/about', :layout => false
  end
  
  def contact
    render 'general_pages/contact', :layout => false
  end
  
  def faq
    render 'general_pages/faq', :layout => false
  end
  
  def feature
    render 'general_pages/feature', :layout => false
  end
  
  def pricing
    render 'general_pages/pricing', :layout => false
  end
  
  def services
    render 'general_pages/services', :layout => false
  end
  
  def tos
    render 'general_pages/tos', :layout => false
  end
  
end