class YelpService

  def get_restaurants_by_end_location(lat, long, food_type)
    # lat_and_long = LocationResults.get_lat_long_by_city(end_location)
    response = conn.get("/v3/businesses/search") do |r|
      r.params[:term] = food_type
      r.params[:latitude] = lat
      r.params[:longitude] = long
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def rest_object(lat, lon, food_type)
    rest_data = get_restaurants_by_end_location(lat,lon, food_type)
    RestaurantFacade.new(rest_data)
  end
  
  private
    def conn
      Faraday.new('https://api.yelp.com/v3') do |f|
        f.header[:Authorization] = ENV['YELP_KEY']
      end
    end
end