class JunksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new ]
  before_action :msg_alert

  def index
    if params[:query].present? or params[:query_min_price].present? or
      params[:query_max_price].present? or params[:location].present? or
      params[:service].present? or params[:junk].present?
      #set the max price so it will return all items if there is no input.
      if params[:query_max_price] == ""
        params[:query_max_price] = "99999"
      end

      if params[:junk].present?
        params[:query_max_price] = "0"
      end

      sql_query = "(title ILIKE :query OR description ILIKE :query)"
      price_query = "price BETWEEN :query_min_price AND :query_max_price"
      location_query = "address ILIKE :location"

      @junks = Junk.where("#{sql_query} AND #{price_query} AND #{location_query}",
        query: "%#{params[:query]}%",
        query_min_price: params[:query_min_price].to_i,
        query_max_price: params[:query_max_price].to_i,
        location: "%#{params[:location]}%"
      )

    else
      @junks = Junk.all
    end

    # The `geocoded` scope filters only junks with coordinates
    @markers = @junks.geocoded.map do |junk|
      {
        lat: junk.latitude,
        lng: junk.longitude,
        info_window: render_to_string(partial: "popup_map", locals: { junk: junk }),
        image_url: helpers.asset_url("hammer-solid.svg")
      }


    end
  end

  def show
    @junk = Junk.find(params[:id])
    @junk_array = [@junk]
    @markers = [{lat: @junk.latitude, lng: @junk.longitude,
      image_url: helpers.asset_url("hammer-solid.svg"),
      info_window: render_to_string(partial: "popup_map", locals: { junk: @junk })}]
  end

  def new
    @junk = Junk.new
  end

  def create
    @junk = Junk.new(junk_params)
    @junk.user = current_user
    if @junk.save
      redirect_to junk_path(@junk)
      flash[:notice] = "Thank you, your ad was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @junk = Junk.find(params[:id])
  end

  def update
    @junk = Junk.find(params[:id])
    @junk.update(junk_params)
    redirect_to junk_path(@junk)
  end

  def destroy
    @junk = Junk.find(params[:id])
    @junk.destroy
    @user = current_user
    redirect_to user_path(@user), status: :see_other
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

  def junk_params
    params.require(:junk).permit(:title, :address, :description, :price, :category, :donation, :delivery, photos: [])
  end
end
