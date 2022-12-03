class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :service_params, only: [:create]


  def index

    if params[:query].present? or params[:query_min_price].present? or params[:query_max_price].present?
      if params[:query_max_price] == ""
        params[:query_max_price] = "99999"
      end
      sql_query = "(title ILIKE :query OR description ILIKE :query OR craft ILIKE :query)"
      price_query = "price BETWEEN :query_min_price AND :query_max_price"
      @services = Service.where("#{sql_query} AND #{price_query}", query: "%#{params[:query]}%",
      query_min_price: params[:query_min_price].to_i, query_max_price: params[:query_max_price].to_i)
    else
      @services = Service.all
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @services.geocoded.map do |service|
    {
      lat: service.latitude,
      lng: service.longitude,
      image_url: helpers.asset_url("person-solid.svg")
    }
    end

  end

  def show
    @markers = [{lat: @service.latitude, lng: @service.longitude, image_url: helpers.asset_url("person-solid.svg")}]
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
      params.require(:service).permit(:description, :price, :craft, :volunteer, :title, :address, :user_id, photos: [])
    end

end
