class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end
  
  def jobs
    @morten = "Hallo hallo"
  end
  
  def contact
  end
end