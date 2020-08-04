class Api::V1::MunchiesController < ApplicationController
  def index
    binding.pry
    location = LocationResults.new.get_lat_long_by_city(params[:location])
    render json: MunchieSerializer.new
  end
end