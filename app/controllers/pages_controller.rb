class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :msg_alert

  def home
    @junks = Junk.all
  end

  private
    def msg_alert
      #check user and chatroom do exist before passing the varialbe.
      if current_user != nil
        if (Chatroom.find_by(name: current_user.username) != nil)
          @chatroom = Chatroom.find_by(name: current_user.username).id
          @messages = Message.find_by(chatroom_id: @chatroom)
        end
      end
    end
end
