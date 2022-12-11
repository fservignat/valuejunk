class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = current_user
    @junks = @user.junks
    @services = @user.services
    # @specialties = @user.specialties
  end

  def edit

  end
end
