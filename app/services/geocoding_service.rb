class GeocodingService
  def location_lat_long(location)
    response = conn.get('/geocoding/v1/address') do |r|
      r.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_trip_info(start_location, end_location)
    response = conn.get("/directions/v2/route") do |r|
      r.params[:from] = start_location
      r.params[:to] = end_location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_trip_duration(start_location, end_location)
    response = get_trip_info(start_location, end_location)
    {
      time: response[:route][:time]
    }
  end
  
  private
    def conn
      Faraday.new('http://www.mapquestapi.com') do |f|
        f.params[:key] = ENV['GEOCODING_KEY']
      end
    end
end