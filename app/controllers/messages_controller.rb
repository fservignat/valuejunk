class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(
          partial: "messages/message",
          locals: { message: @message}
        )
      )
      head :ok #don't send a view and don't make thme redirect
    end
  end

  def destroy
    @messages = Message.all
    @messages.destroy_all()
    redirect_to chatroom_path, status: :see_other
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
