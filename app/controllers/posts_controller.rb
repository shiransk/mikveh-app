class PostsController < ApplicationController
before_action :user_logged_in? , except: [:index]
  def index 
    @posts = Post.all 
  end

  def new
    
  end

  def create
    @post = Post.new(text: params[:text], subject: params[:subject], user_id: params[:user_id])
    if @post.save
      flash[:success] = "Post Created"
      redirect_to '/posts'
    else
      flash[:danger] = "Post Not Created"
      redirect_to '/'
    end
  end
 

end
