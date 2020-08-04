class Api::V1::ForecastController < ApplicationController
  def index
    location = LocationResults.new.get_lat_long_by_city(params[:location])
    # binding.pry
    weather_data = WeatherResults.new.weather_by_location(location)   

    render json: ForecastSerializer.new(weather_data).serialized_json
  end
end