class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @junks = Junk.all
    @messages = Message.find_by(user_id: current_user)
  end
end
