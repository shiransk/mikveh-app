class MikvehsController < ApplicationController

  def new
  end

  def create
    mikveh = Mikveh.new(name: params[:name], location: params[:location], rooms: params[:rooms], user_id: params[:user_id], image: params[:image])
    if mikveh.save
      flash[:success] = "Mikveh created!"
      redirect_to "/mikveh/#{mikveh.id}"
    else
      flash[:danger] = "Mikveh not creted"
      redirect_to '/dashboard_balanit'
    end  
  end

  def show  
    @mikveh = Mikveh.find_by(id: params[:id])
  end

end
