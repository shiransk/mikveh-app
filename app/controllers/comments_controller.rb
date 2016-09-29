class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], text: params[:text])
    if @comment.save 
      flash[:success] = "Comment Posted"
      redirect_to '/posts'
    else
      flash[:danger] = "Something went wrong"
      redirect_to '/posts'
    end
  end

  def edit 
    @comment = Comment.find_by(id: params[:id])
    @post_id = params[:post_id]
  end


  def update
    comment = Comment.find_by(id: params[:id])
    comment.text = params[:text]
    comment.post_id = params[:post_id]
    if comment.save 
      flash[:success] = "Comment Created"
      redirect_to '/posts'
    else
      flash[:danger] = "Comment not Created"
      redirect_to '/posts'
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      flash[:success] = "Comment Deleted"
      redirect_to '/posts'
    else
      flash[:danger] = "Comment not Deleted!"
      redirect_to '/posts'
    end
  end

end
