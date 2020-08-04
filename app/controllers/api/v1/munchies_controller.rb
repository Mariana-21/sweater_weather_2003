class Api::V1::MunchiesController < ApplicationController
  def index
    food_type = params[:food]
    start_location = LocationResults.new.get_lat_long_by_city(params[:start])
    start_lat = start_location.first
    start_long = start_location.last
    end_location = LocationResults.new.get_lat_long_by_city(params[:end])
    lat = end_location.first
    long = end_location.last
    munchie_data = MunchieResults.new.info(lat, long, food_type, start_lat, start_long)
    # binding.pry
    render json: MunchieSerializer.new(munchie_data)
  end
end