require 'rails_helper'

RSpec.describe WeatherResults do
  describe 'class methods' do
    location = "Denver,CO"

    location_results = LocationResults.new.get_lat_long_by_city(location)
    lat = location_results.first
    long = location_results.last
    results = WeatherResults.new.weather_by_location(lat, long)
    binding.pry
  end
end