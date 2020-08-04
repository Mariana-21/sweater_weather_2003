class GeocodingService
  def location_lat_long(location)
    response = conn.get('/geocoding/v1/address') do |r|
      r.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_location_objects(location)
    location_info = location_lat_long(location)
    Geocode.new(location_info)
  end
  
  private
    def conn
      Faraday.new('http://www.mapquestapi.com') do |f|
        f.params[:key] = ENV['GEOCODING_KEY']
      end
    end
end