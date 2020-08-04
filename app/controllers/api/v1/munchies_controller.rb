class Api::V1::MunchiesController < ApplicationController
  def index
    location = LocationResults.new.get_lat_long_by_city(params[:end])
    binding.pry
    render json: MunchieSerializer.new
  end
end