class PostsController < ActionController::Base
  layout 'application'  #not sure why this is needed even?
  before_filter :authenticate_user!
  
  def index
    @posts=Post.all.order('created_at DESC')
  end
  
  def new
  end
  
  def create
     @post=current_user.posts.new(post_params)
     if @post.save
       redirect_to posts_path
    
     else
       redirect_to user_path(current_user)
     end
  end
  
  private
      # Using a private method to encapsulate the permissible parameters is just a good pattern
      # since you'll be able to reuse the same permit list between create and update. Also, you
      # can specialize this method with per-user checking of permissible attributes.
      def post_params
        params.require(:post).permit(:content, :user_id)
      end
end
