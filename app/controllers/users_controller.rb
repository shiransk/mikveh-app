 class UsersController < ApplicationController

  # before_action :is_admin?, except: [:client_calender,:index ]

  def client_calender
    @bookings = Booking.all
    @start_time = Time.zone.parse("18:00:00 ")
    @mikveh = Mikveh.find_by(id: params[:id])
  end 

  def index
    
  end

  def new_balanit
    @user = User.new 
  end

  def new_client
    @user = User.new 
  end

  def calendar
    if current_user && current_user.balanit
      @bookings = current_user.mikveh.bookings.all

      @start_time = Time.parse("18:00:00")
    end 
  end

  def dashboard_client
     @bookings = current_user.bookings.all 
  end

  def dashboard_balanit
    @bookings = current_user.mikveh.bookings.all 
    @start_time = Time.parse("18:00:00")
      if current_user && current_user.balanit
        @mikveh = Mikveh.find_by(user_id: current_user.id)
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
