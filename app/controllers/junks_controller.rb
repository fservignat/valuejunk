class JunksController < ApplicationController
  def index
    @junks = junk.all
  end

  def show
    @junk = Junk.find(params[:id])
  end
end
