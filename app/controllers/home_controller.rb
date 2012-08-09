class HomeController < ApplicationController

  def index
    redirect_to login_path
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def terms
  end
 
  def test 
    render layout: 'index'
  end

end
