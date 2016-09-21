class ChatRoomsController < ApplicationController

  def index 
    @chat_rooms = current_user.chat_rooms
  end

  def show
    @chat_room =ChatRoom.find_by(id: params[:id]) 
    @messages = @chat_room.messages
  end


end
