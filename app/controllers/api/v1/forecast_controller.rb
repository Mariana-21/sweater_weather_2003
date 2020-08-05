class Api::V1::ForecastController < ApplicationController
  def index
    location = LocationResults.new.get_lat_long_by_city(params[:location])
    lat = location.first
    long = location.last
    weather_data = WeatherResults.new.weather_by_location(lat, long) 

    render json: ForecastSerializer.new(weather_data)
  end
end