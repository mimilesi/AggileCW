class PagesController < ApplicationController

  
  def home
    @title = "Home"
    @micropost = Micropost.new if signed_in?
  end

  def contact
    @title = "Contact"
    
  end

  def about
    @title = "About"
    
  end

  def events
    @title = "Events"
    
  end

  def findus
    @title = "Find Us"
    
  end
  
  

end
