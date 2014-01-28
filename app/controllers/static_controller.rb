class StaticController < ActionController::Base
  layout 'application'  #not sure why this is needed even?
  before_filter :authenticate_user!,
      :only => [:contact]
  def home
  end
  
  def about
  end
  
  def contact
    
  end
end
