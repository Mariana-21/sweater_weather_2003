class MunchieResults 

  def null
    "null"
  end

  def rest_data(lat, long, food_type)
    YelpService.new.get_restaurants_by_end_location(lat, long, food_type)
  end 
  
  def start_location(lat,long)
    start_location = GeocodingService.new.get_city_by_lat_long(lat, long)
    JSON.parse(start_location.body, symbolize_names: true)
  end
  
  def end_location(lat,long)
    end_location = GeocodingService.new.get_city_by_lat_long(lat, long)
    JSON.parse(end_location.body, symbolize_names: true)

  end
  
  def end_location_forecast(lat, long)
    WeatherService.new.weather_objects(lat, long)
  end
  
  def info(lat, long, food_type, start_lat, start_long)
    # binding.pry
      {
        null: "null",
        start_location: start_location(start_lat, start_long)[:results][0][:locations][0][:adminArea5],
        end_location: end_location(lat, long)[:results][0][:locations][0][:adminArea5],
        destination_forecast: {
          current: "Looks like #{end_location_forecast(lat, long).forecast_info[:current][:weather][0][:main]} skies for now!",
          arrival: "The skies are going to be #{end_location_forecast(lat, long).forecast_info[:hourly][0][:weather][0][:main]}!"
        },
        restaurant: {
          name: rest_data(lat, long, food_type)[:businesses][0][:name],
          address: rest_data(lat, long, food_type)[:businesses][0][:location][:address1]
        }
      }
  end
end