class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination

  def initialize(start_location, end_location)
    @id = "null"
    @origin = start_location
    @destination = end_location
  end

  def arrival_forecast
    get_serialized_forecast[:data][:attributes][:hourly_weather_forecast].each do |hour|
      if hour[:time] == get_arrival_time
        # binding.pry
        return "#{hour[:temp]}, #{hour[:description]}"
      end
    end
  end

  def travel_time
    Time.at(trip_duration[:time]).utc.strftime("%H hour(s) and %M minuets")
    # time.strftime("%H hours")
    # binding.pry
  end

  private

    def get_serialized_forecast
      json = ForecastSerializer.new(get_forecast_object).serialized_json
      JSON.parse(json, symbolize_names: true)
    end

    def get_forecast_object
      lat_long = LocationResults.new.get_lat_long_by_city(@destination)
      lat = lat_long.first
      long = lat_long.last
      WeatherService.new.weather_objects(lat, long)
    end

    def trip_duration
      (GeocodingService.new).get_trip_duration(@origin, @destination)
    end

    def get_arrival_time
      # binding.pry
      arrival_time = (Time.now.utc.to_i + get_forecast_object.timezone_offset) + trip_duration[:time]
      DateTime.strptime("#{arrival_time}",'%s').strftime("%l %p")
    end
end