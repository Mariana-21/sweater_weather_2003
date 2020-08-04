class RestaurantResults 

  def rest_by_location(lat, long, food_type)
    json = YelpService.new.rest_object(lat, lon, food_type)
  end
end