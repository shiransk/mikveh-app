class BookingsController < ApplicationController

  def new 
     
  end

  def create
    if current_user
      starting_time = DateTime.parse(params[:start_time])
      end_time = starting_time + 29.minutes
      clashed_bookings = Booking.where(start_time: starting_time..end_time)
      clashed_bookings2 = Booking.where(start_time: starting_time - 29.minutes..starting_time)

      if clashed_bookings.empty? && clashed_bookings2.empty?
        if current_user.balanit
          booking = Booking.new(user_id: params[:user][:user_id], start_time: params[:start_time],mikveh_id: current_user.mikveh.id)
        else
          booking = Booking.new(user_id: params[:user_id], start_time: params[:start_time],mikveh_id: params[:mikveh][:mikveh_id])
        end
      end
    end

    if booking && booking.save 
      flash[:success] = "apoitment was booked!"
      if current_user.balanit
        redirect_to '/dashboard_balanit'
      else
        redirect_to "/bookings/#{booking.id}"
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
    Booking.find_by(id: params[:id]).destroy
    flash[:danger] = 'Apoitment was canceld'
    redirect_to '/dashboard_balanit'
  end

end
