class GeocodingService
  def location_lat_lon(location)
    response = conn.get('/geocoding/v1/address') do |r|
      r.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  private
    def conn
      Faraday.new('http://www.mapquestapi.com') do |f|
        f.params[:key] = ENV['GEOCODING_KEY']
      end
    end
end