class BookingsController < ApplicationController

  def new 
    
  end

  def create
    booking = Booking.new(user_id: params[:user_id], mikveh_id: params[:mikveh][:mikveh_id], date_and_time: params[:date_and_time])
    if booking.save 
      flash[:success] = "apoitment was booked!"
      redirect_to "/bookings/#{booking.id}"
    else
      flash[:danger] = "Problem"
      redirect_to '/bookings'
    end      
  end

  def edit
     @booking = Booking.find_by(id: params[:id])  
  end

  def update
    booking = Booking.find_by(id: params[:id])
    booking.assign_attributes(date_and_time: params[:date_and_time], mikveh_id: params[:mikveh_id], user_id: params[:user_id])
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
    Booking.find_by(id: params[:id]).destroy
    flash[:danger] = 'Apoitment was canceld'
    redirect_to '/dashboard_balanit'
  end

end
