class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :human_time

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def human_time(time)
    time.strftime("%H:%M:%p")
  end

   
  
end
