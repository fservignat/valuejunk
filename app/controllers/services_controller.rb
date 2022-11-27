class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :service_params, only: [:create]


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
    @service.user = current_user

    if @service.save
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path, status: :see_other
  end

  private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service)
      .permit(:description, :price, :craft, :volunteer, :title, :address, :user_id, photos: [], speciality_list: [])
    end

end
