class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], text: params[:text])
    if @comment.save 
      flash[:success] = "Comment Posted"
      redirect_to '/posts'
    else
      flash[:danger] = "Somthing went wrong"
      redirect_to '/posts'
    end
  end
end
