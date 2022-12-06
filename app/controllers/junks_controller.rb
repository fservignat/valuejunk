class JunksController < ApplicationController
  def index
    @junks = Junk.all

    if params[:query].present?
      @junks = @junks.where("title ILIKE ?", "%#{params[:query]}%")
    end

    if params[:query_min_price].present?
      unless params[:query_max_price] == ""
        @junks = @junks.where("price > ?", "%#{params[:query_min_price]}%")
      end
    end

    if params[:query_max_price].present?
      unless params[:query_max_price] == "99999"
        @junks = @junks.where("price < ?", "%#{params[:query_max_price]}%")
      end
    end

    if params[:location].present?
      @junks = @junks.near(params[:location], 10)
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
    @markers = [{lat: @junk.latitude, lng: @junk.longitude, image_url: helpers.asset_url("hammer-solid.svg")}]
  end

  def new
    @junk = Junk.new
  end

  def create
    @junk = Junk.new(junk_params)
    @junk.user = current_user
    if @junk.save
      redirect_to junk_path(@junk)
    else
      render :new
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
    redirect_to junks_path, status: :see_other
  end

    private

  def junk_params
    params.require(:junk).permit(:title, :address, :description, :price, :category, photos: [])
  end
end
