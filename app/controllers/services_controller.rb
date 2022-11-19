class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :create]

  def index
    @services = Service.all
  end

  def show

  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:description, :price, :craft, :volunteer, :title, :address, :user_id)
    end

end
