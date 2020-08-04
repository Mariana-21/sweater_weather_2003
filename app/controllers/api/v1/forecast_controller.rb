class Api::V1::ForecastController < ApplicationController
  def index
    location = LocationResults.new.get_lat_long_by_city(params[:location])
    lat = location.first
    long = location.last
    # binding.pry
    weather_data = WeatherResults.new.weather_by_location(lat, long) 
    # binding.pry  

    render json: ForecastSerializer.new(weather_data)
  end

  # private

  #   def get_forecast_object
  #     forecast_service = WeatherService.new(params[:location])
  #     forecast_service.weather_objects(lat, long)
  #   end
end