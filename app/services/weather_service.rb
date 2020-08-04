class WeatherService

  def location_weather(lat, lon)
    response = conn.get("/data/2.5/onecall") do |r|
      r.params[:lat] = lat 
      r.params[:lon] = lon
      r.params[:units] = "imperial"
      r.params[:exclude] = "minutely"
    end 
  json = JSON.parse(response.body, symbolize_names: true)
  end

  def weather_objects(lat, lon)
    weather_data = location_weather(lat,lon)
    ForecastFacade.new(weather_data)
  end
  private 
  
  def conn
    Faraday.new("https://api.openweathermap.org") do |faraday|
      faraday.params[:appid] = ENV['WEATHER_API_KEY']
    end
  end

end