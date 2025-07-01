class GiftsController < ApplicationController
  def index
    @gifts = Gift.ordered
  end
end
