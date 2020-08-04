class WeatherResults 

  def weather_by_location(lat, long)
    # binding.pry
    json = WeatherService.new.weather_objects(lat, long)
  end
end