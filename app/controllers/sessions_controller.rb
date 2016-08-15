class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "You are loged in #{user.name}"
      redirect_to '/'
    else 
      flash[:danger] = "Error"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You are loged of"
    redirect_to '/'
  end
  
end
