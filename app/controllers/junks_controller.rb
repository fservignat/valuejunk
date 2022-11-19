class JunksController < ApplicationController

  def new
    @junk = Junk.new
  end
end
