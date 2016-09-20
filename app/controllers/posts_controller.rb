class PostsController < ApplicationController
before_action :user_logged_in? , except: [:index]

  def index 
    @posts = Post.all 
  end

  def new
    
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(text: params[:text], user_id: params[:user_id])
    if @post.save
      flash[:success] = "Post Created"
      redirect_to '/posts'
    else
      flash[:danger] = "Post Not Created"
      redirect_to '/'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id]) 
  end

  def update
    post = Post.find_by(id: params[:id])
    post.text = params[:text]
    post.user_id = params[:user_id]
    if post.save
      flash[:success] = "Post Updated" 
      redirect_to '/posts'
    else
      flash[:danger] = "Post Not Updated"
      redirect_to '/posts'
    end
  end

  def destroy 
    post = Post.find_by(id: params[:id])
    if post.destroy
      flash[:success] = "Post Deleted"
      redirect_to '/posts'
    else
        flash[:danger] = "Post Not Deleted"
        redirect_to '/'
    end
  end



end
