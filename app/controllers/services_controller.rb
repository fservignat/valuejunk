class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  def index
    @services = Service.all
  end

  def show

  end

  private

    def set_service
      @service = Service.find(params[:id])
    end

    def junk_params
      params.require(:junk).permit(:title, :address, :description, :price, :craft, :specialty, photos: [])
    end
end
