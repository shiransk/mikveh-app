class BookingsController < ApplicationController

  def new 
    
  end

  def create
    booking = Booking.new(user_id: params[:user_id], mikveh_id: params[:mikveh][:mikveh_id], time: params[:time])
      # binding.pry
    if booking.save 
      flash[:success] = "apoitment was booked!"
      redirect_to "/bookings/#{booking.id}"
    else
      flash[:danger] = "Problem"
      redirect_to '/bookings'
    end      
  end

  def show
    @booking = Booking.find_by(id: params[:id])
  end

  def destroy
    Booking.find_by(id: params[:id]).destroy
    redirect_to '/dashboard_balanit'
  end

end
