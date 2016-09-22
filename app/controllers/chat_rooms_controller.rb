class ChatRoomsController < ApplicationController

  def show
    @chat_rooms = current_user.all_chat_rooms
    @chat_room = ChatRoom.find_by(id: params[:id]) 
    @messages = @chat_room.messages
  end

end
