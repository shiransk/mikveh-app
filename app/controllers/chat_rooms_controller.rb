class ChatRoomsController < ApplicationController

  def show
    @chat_room = ChatRoom.find_by(id: params[:id])

    @chat_room.messages.each do |message|
        message.read = true
        message.save
    end

    @mikveh_chats = current_user.mikveh_chat_rooms
    @chat_rooms = current_user.single_chat_rooms
    @messages = @chat_room.messages
    @general_chat = ChatRoom.find_by(id: 1)
  end

    # @users_id = []
    # current_user.mikveh.bookings.each do |booking| 
    #   @users_id << booking.user_id
    # end 
    # User.where(user_id: )

end
