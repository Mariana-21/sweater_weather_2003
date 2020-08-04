class LocationResults 
  def get_lat_long_by_city(location)
    location = GeocodingService.new.location_lat_long(location)
    # binding.pry
    lat_long = []
    lat = location[:results][0][:locations][0][:latLng][:lat]
    long = location[:results][0][:locations][0][:latLng][:lng]
    lat_long << lat
    lat_long << long
    lat_long
  end
end 