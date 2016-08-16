class BookingsController < ApplicationController

  def new 
    
  end

  def create
    booking = Booking.new(user_id: params[:user_id], mikveh_id: params[:mikveh][:mikveh_id], time: params[:time])
    if booking.save 
      flash[:success] = "apoitment was booked!"
      redirect_to "/bookings/#{booking.id}"
    else
      flash[:danger] = "Problem"
      redirect_to '/bookings'
    end      
  end

  def edit
    id = current_user.bookings.last.id
    @booking = Booking.find_by(id: id)
  end

  def update
    booking = Booking.find_by(id: params[:id])
    booking.assign_attributes(time: params[:time], mikveh_id: params[:mikveh_id], user_id: params[:user_id])
    # binding.pry
    if booking.save
      flash[:success] = "apoitment updated"
      redirect_to '/dashboard_client'
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
    redirect_to '/dashboard_balanit'
  end

end
