class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = current_user
    @junks = @user.junks
    @services = @user.services

    #store the specialities tags in an array
    @tags_array = Array.new()
    @services.map do |service|
      service.speciality_list.each do |speciality|
        @tags_array.append(speciality)
      end
    end
  end

  def edit

  end
end
