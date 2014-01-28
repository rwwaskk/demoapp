class UsersController < ActionController::Base
  layout 'application'  #not sure why this is needed even?
  before_filter :authenticate_user!
  
  def index
    @users=User.all
  end
  
  def show
    @user=current_user
    
    @posts=current_user.posts.order('created_at DESC')
  end
end
