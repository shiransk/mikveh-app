class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user 
    @url = "http://localhost:3000/"
    mail(to: @user.email, subject: 'Welcome!')
  end

  def booking_email(user) 
    @user = user
    if !@user.balanit
      mail(to: @user.email, subject: 'Apoitment made')
    end
  end

  def booking_email_balanit(user) 
    @user = user
    mail(to: "#{@user.bookings.last.mikveh.user.email}", subject: 'Client Apoitment made', body: "#{@user.name} has made an apoitment for #{@user.bookings.last.start_time}")
  end

  def cancel_boooking_email(deleted_booking)
    @deleted_booking = deleted_booking 
    mail(to: @deleted_booking.user.email, subject: 'Apoitment canceld')
  end
  
  def cancel_boooking_email_balanit(deleted_booking)
    @booking_deleted = deleted_booking
    mail(to: "#{@booking_deleted.mikveh.user.email}", subject: 'Client Apoitment canceld', body: "#{@booking_deleted.mikveh.user.name} has canceld is apoitment for #{@booking_deleted.start_time}")
  end

end
