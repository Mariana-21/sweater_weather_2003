class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :current_temp, :hourly, :daily, :uvi, :sunrise, :sunset, :feels_like
end
