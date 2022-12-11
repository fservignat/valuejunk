class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :service_params, only: [:create]
  before_action :msg_alert


  def index

    if params[:query].present? or params[:query_min_price].present? or
      params[:query_max_price].present? or params[:location].present? or
      params[:service].present? or params[:junk].present?
      #set the max price so it will return all items if there is no input.
      if params[:query_max_price] == "" or params[:query_max_price] == nil
        params[:query_max_price] = "99999"
      end

     # if params[:service].present?
      #  params[:query_max_price] = "0"
      #end

      sql_query = "(title ILIKE :query OR description ILIKE :query)"
      price_query = "price BETWEEN :query_min_price AND :query_max_price"
      location_query = "address ILIKE :location"
      @services = Service.where("#{sql_query} AND #{price_query} AND #{location_query}",
        query: "%#{params[:query]}%",
        query_min_price: params[:query_min_price].to_i,
        query_max_price: params[:query_max_price].to_i,
        location: "%#{params[:location]}%"
      )



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

  def tagged

    if params[:speciality].present?
      @services = Service.tagged_with(params[:speciality])
    else
      @services = Service.all
    end
    @markers = @services.geocoded.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        image_url: helpers.asset_url("person-solid.svg")
      }
      end
    render :index
  end

  def show
    @markers = [{lat: @service.latitude, lng: @service.longitude, image_url: helpers.asset_url("person-solid.svg")}]
  end

  def new
    @service = Service.new
    @service_template=Service.new(description: "", address: "", user: current_user)
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service_template=Service.new(description: "", address: "", user: current_user)

    if @service.volunteer = true
      @service.price = 0
    end

    if @service.save
      redirect_to service_path(@service)
      flash[:notice] = "Thank you, your ad was successfully created!"
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
    params.require(:service).permit(:description, :price, :craft, :volunteer, :title, :address, :user_id, photos: [], speciality_list: [])
  end

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
