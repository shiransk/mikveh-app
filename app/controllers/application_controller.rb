class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :human_time

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def human_time(time)
    time.strftime("%H:%M:%p")
  end

  def check_mikveh
    if current_user && current_user.balanit 
      if current_user.mikveh 

      else
        flash[:danger] = "Must Register Mikveh to continue"
        redirect_to '/mikveh'
      end
    end
  end

end
