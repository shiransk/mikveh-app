class MikvehsController < ApplicationController

before_action :check_mikveh , except: [:create, :new]

  def new
  end

  def create
    mikveh = Mikveh.new(name: params[:name], location: params[:location], rooms: params[:rooms], user_id: params[:user_id], image: params[:image], supervision: params[:supervision], shul: params[:shul])
    if mikveh.save
      flash[:success] = "Mikveh created!"
      redirect_to "/mikvehs/#{mikveh.id}"
    else
      flash[:danger] = "Mikveh not creted"
      redirect_to '/dashboard_balanit'
    end  
  end

  def show  
    @mikveh = Mikveh.find_by(id: params[:id])
  end

  def edit
    @mikveh = Mikveh.find_by(id: params[:id])
  end

  def update
    mikveh = Mikveh.find_by(id: params[:id])
    mikveh.name = params[:name]
    mikveh.location = params[:location]
    mikveh.user_id = params[:user_id]
    mikveh.shul = params[:shul]
    mikveh.supervision = params[:supervision]
    mikveh.image = params[:image]
    if mikveh.save
      flash[:success] = "Mikveh Updated"
      redirect_to "/mikvehs/#{mikveh.id}"
    else
      flash[:danger] = "Mikveh Not Updated"
      redirect_to '/'
    end
  end

end
