class JunksController < ApplicationController
  def index
    @junks = Junk.all
  end

  def show
    @junk = Junk.find(params[:id])
  end
end
