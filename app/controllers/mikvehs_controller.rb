class MikvehsController < ApplicationController

before_action :check_mikveh , except: [:create, :new]

  def new
  end

  def create
    mikveh = Mikveh.new(name: params[:name], location: params[:location], phone_number: params[:phone_number], user_id: params[:user_id], image: params[:image], supervision: params[:supervision], shul: params[:shul])
    if mikveh.save
      flash[:success] = "Mikveh created!"
      if ChatRoom.where(user_id: mikveh.id, room_type: "mikveh_chat").empty?
        chat = ChatRoom.new(user_id: mikveh.user.id, room_type: "mikveh_chat") 
        if chat.save
      flash[:success] = "Mikveh Chat created!"
      redirect_to "/mikvehs/#{mikveh.id}"
        end
    else
      flash[:danger] = "Mikveh not created"
      redirect_to '/dashboard_balanit'
    end  
  end
  end

  def index
    
  end

  def index_map

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
    mikveh.phone_number =params[:phone_number]
    if mikveh.save
      flash[:success] = "Mikveh Updated"
      redirect_to "/mikvehs/#{mikveh.id}"
    else
      flash[:danger] = "Mikveh Not Updated"
      redirect_to '/'
    end
  end

end
