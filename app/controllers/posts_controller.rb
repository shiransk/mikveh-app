class PostsController < ApplicationController

  def index 
    @posts = Post.all 
  end

  def new
    
  end

  def create
    @post = Post.new(text: params[:text], subject: params[:subject])
    if @post.save
      flash[:success] = "Post Created"
      redirect_to '/posts'
    else
      flash[:danger] = "Post Not Created"
      redirect_to '/'
    end
  end


end
