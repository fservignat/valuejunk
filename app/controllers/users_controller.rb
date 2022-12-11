class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @junks = @user.junks
    @services = @user.services
    # @specialties = @user.specialties
  end

  def edit

  end
end
