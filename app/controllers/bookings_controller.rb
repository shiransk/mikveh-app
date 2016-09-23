  class BookingsController < ApplicationController

before_action :check_mikveh

  def new
    # if params[:time]
      @booking_time = params[:time]
      @mikveh_id = params[:mikveh_id]
      @clean_time = DateTime.parse(@booking_time)
    # else
    #   @booking_time = ''
    # end
  end

  def create
    if current_user
      starting_time = DateTime.parse(params[:start_time])
      end_time = starting_time + 29.minutes

      clashed_bookings = Booking.where(mikveh_id: params[:mikveh_id], start_time: starting_time..end_time)

      clashed_bookings2 = Booking.where(mikveh_id: params[:mikveh_id], start_time: starting_time - 29.minutes..starting_time)
      if clashed_bookings.empty? && clashed_bookings2.empty?
        if current_user.balanit && current_user.mikveh.id == @mikveh_id.to_i
          booking = Booking.new(user_id: params[:user][:user_id], start_time: params[:start_time],mikveh_id: current_user.mikveh.id)
        
        else
          booking = Booking.new(user_id: params[:user_id], start_time: params[:start_time],mikveh_id: params[:mikveh_id])
        end
      end
    end

    if booking && booking.save 
      flash[:success] = "apoitment was booked!"
      UserMailer.booking_email(current_user).deliver_later
      UserMailer.booking_email_balanit(current_user).deliver_later
      if current_user.balanit
        redirect_to '/calendar' 
      else
        redirect_to "/dashboard_client"
      end
    else
      flash[:danger] = "Booking Failed!!!"
      redirect_to '/'  
    end      
  end

  def edit
     @booking = Booking.find_by(id: params[:id])  
  end

  def update
    booking = Booking.find_by(id: params[:id])
    booking.assign_attributes(start_time: params[:start_time], mikveh_id: params[:mikveh_id], user_id: params[:user_id])
    # binding.pry
    if booking.save
      flash[:success] = "apoitment updated"
      if current_user.balanit 
        redirect_to '/dashboard_balanit'
      else
        redirect_to '/dashboard_client'
      end
    else
      flash[:danger] = "apoitment not updated!!!"
      redirect_to '/'
    end

  end

  def show
    @booking = Booking.find_by(id: params[:id])
  end

  def destroy
    booking_deleted = Booking.find_by(id: params[:id])
    Booking.find_by(id: params[:id]).destroy
    UserMailer.cancel_boooking_email(booking_deleted).deliver_later
    UserMailer.cancel_boooking_email_balanit(booking_deleted).deliver_later
    flash[:danger] = 'Apoitment was canceld'
    if current_user && current_user.balanit
      redirect_to '/dashboard_balanit'
    else
      redirect_to '/dashboard_client'
    end
  end


end
