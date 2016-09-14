class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user 
    @url = "http://localhost:3000/"
    mail(to: @user.email, subject: 'Welcome!')
  end

  def booking_email(user) 
    @user = user
    mail(to: @user.email, subject: 'Apoitment made')
    mail(to: "#{@user.bookings.last.mikveh.user.email}", subject: 'Client Apoitment made', body: "#{@user.name} has made an apoitment for #{@user.bookings.last.start_time}")
  end

  def cancel_boooking_email(user)
    @user = user 
    mail(to: @user.email, subject: 'Apoitment canceld')
    mail(to: "#{@user.bookings.last.mikveh.user.email}", subject: 'Client Apoitment canceld', body: "#{@user.name} has canceld is apoitment")
  end

end
