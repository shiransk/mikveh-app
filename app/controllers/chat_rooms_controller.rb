class ChatRoomsController < ApplicationController


  def show
    @chat_room = ChatRoom.find_by(id: params[:id])

    @mikveh_chats = []
      mikvehs = Mikveh.where(id: current_user.bookings.pluck(:mikveh_id))
      mikvehs.each do |m|
        if m.chatroom
          @mikveh_chats << m.chatroom
        end
      end
      if current_user.mikveh && current_user.mikveh.chatroom && !@mikveh_chats.include?(current_user.mikveh.chatroom)
        @mikveh_chats << current_user.mikveh.chatroom
      end

    @chat_rooms = current_user.all_chat_rooms
    @messages = @chat_room.messages
    @general_caht = ChatRoom.find_by(id: 1)
  end

  # def show
  #   @chat_rooms = current_user.all_chat_rooms
  #   @chat_room = ChatRoom.where(user_id: current_user.id)
  #   if @chat_room.any? 
  #   @messages = @chat_room.messages
  #   end 
  # end


end
