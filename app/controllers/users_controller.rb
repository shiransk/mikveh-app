 class UsersController < ApplicationController

before_action :check_mikveh

  def client_calender
    @bookings = Booking.all
    @start_time = Time.zone.parse("18:00:00 ")
    @mikveh = Mikveh.find_by(id: params[:id])
  end 

  def new_balanit
    @user = User.new 
  end

  def new_client
    @user = User.new 
  end

  def index 
    @users = User.all
  end

  def calendar
    @mikveh_id = current_user.mikveh.id
    if current_user && current_user.balanit
      @bookings = current_user.mikveh.bookings.eager_load(:user)
      @start_time = Time.parse("18:00:00")
    end 
  end

  def dashboard_client
     @bookings = current_user.bookings
  end

  def dashboard_balanit
    @bookings = current_user.mikveh.bookings
    @start_time = Time.parse("18:00:00")
      if current_user && current_user.balanit
        @mikveh = Mikveh.find_by(user_id: current_user.id)
      else
        redirect_to '/dashboard_client'
      end
  end

  def create
    @user = User.new(name: params[:name], email: params[:email],phone_number: params[:phone_number], password: params[:password], password_confirmation: params[:password_confirmation], balanit: params[:balanit], image: params[:image])
    if @user.save
      flash[:success] = "User Created!"
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_later
      if @user.balanit
        redirect_to '/mikvehs'
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

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update

    user = User.find_by(id: params[:id])
    user.update_columns(name: params[:name], email: params[:email],phone_number: params[:phone_number])
    user.image = params[:image]
    user.password = 
    user.password_confirmation = 
    user.save
    flash[:success] = "User Updated"
    redirect_to '/'

    # user.name = params[:name]
    # user.email = params[:email]
    # user.phone_number = params[:phone_number]
    # user.image = params[:image]
    # if user.save
    #   flash[:success] = "User Updated"
    #   redirect_to '/'
    # else
    #   dsads
    #   flash[:danger] = "User Not Updated"
    #   redirect_to '/'
    # end
  end
    

end
