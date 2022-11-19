class JunksController < ApplicationController
  def index
    @junks = Junk.all
  end

  def show
    @junk = Junk.find(params[:id])
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

  private

  def junk_params
    params.require(:junk).permit(:title, :address, :description, :price, :category)
  end
end
