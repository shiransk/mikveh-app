class UsersController < ApplicationController

  def new

  end

  def new_balanit

  end

  def new_client

  end

  def dashboard_client

  end

  def dashboard_balanit
    if current_user && current_user.balanit
    @mikveh = Mikveh.find_by(user_id: current_user.id)
    # binding.pry
    else
      redirect_to '/new_client'
    end
  end

  def create
    user = User.new(name: params[:name], email: params[:email],phone_number: params[:phone_number], password: params[:password], password_confirmation: params[:password_confirmation], balanit: params[:balanit])
    if user.save
      flash[:success] = "User Created!"
      session[:user_id] = user.id
      if user.balanit
        redirect_to '/mikveh'
      else
        # direct them to search
      redirect_to '/'
      end
    else
      flash[:danger] = "User not created!"
      redirect_to '/new_client'
    end
    
  end

end
