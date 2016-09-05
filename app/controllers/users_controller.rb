class UsersController < ApplicationController

  def test
  end 

  def index
    
  end

  def new_balanit
    @user = User.new 
  end

  def new_client
    @user = User.new 
  end

  def dashboard_client
     @bookings = Booking.all 
  end

  def dashboard_balanit
    @bookings = Booking.all 
    if current_user && current_user.balanit
      @mikveh = Mikveh.find_by(user_id: current_user.id)
    # binding.pry
    else
      redirect_to '/dashboard_client'
    end
  end

  def create
    @user = User.new(name: params[:name], email: params[:email],phone_number: params[:phone_number], password: params[:password], password_confirmation: params[:password_confirmation], balanit: params[:balanit])
    if @user.save
      flash[:success] = "User Created!"
      session[:user_id] = @user.id
      if @user.balanit
        redirect_to '/mikveh'
      else
        # direct them to search
      redirect_to '/dashboard_client'
      end
    else
      flash[:danger] = "User not created!"
      if @user.balanit 
        render :new_balanit  
      else
        render :new_client 
      end
    end
    
  end

end
