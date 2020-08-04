class WeatherResults 
# binding.pry
  def weather_by_location(lat, long)
    # binding.pry
    json = WeatherService.new.weather_objects(lat, long)
    # binding.pry
  end
  
  def null
    "null"
  end
end