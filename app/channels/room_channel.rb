class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end
 
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
 
  def speak(data)
    # ActionCable.server.broadcast "room_channel", message: data['message']
    Message.create!(content: data['message'], 
                    user_id: data['user_id'], 
                    chat_room_id: data['chat_room_id'])
  end
end
