class WeatherResults 
  def weather_by_location(lat, long)
    json = WeatherService.new.weather_objects(lat, long)
  end
end





