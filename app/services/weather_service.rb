class WeatherService
  def location_weather(lat, lon)
    response = conn.get("/data/2.5/onecall") do |r|
      r.params[:lat] = lat 
      r.params[:lon] = lon
      r.params[:exclude] = "minuetly"
      r.params[:units] = "imperial"
    end 
  json = JSON.parse(response.body, symbolize_names: true)
  end

  private 
  
  def conn
    Faraday.new("https://api.openweathermap.org") do |faraday|
      faraday.params[:appid] = ENV['WEATHER_API_KEY']
    end
  end
end