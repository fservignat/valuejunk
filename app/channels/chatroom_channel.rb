class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    #this is important in determining the channel; TODO
    chatroom = Chatroom.find(params[:id])
    # stream_from "general"
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
