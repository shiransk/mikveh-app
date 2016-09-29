  class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    # binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "You are signed in #{user.name}"
      if current_user && current_user.balanit
        redirect_to '/dashboard_balanit'
      else
        redirect_to '/dashboard_client'
      end
    else 
      flash[:danger] = "Error"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You are no longer signed in."
    redirect_to '/'
  end
  
end
