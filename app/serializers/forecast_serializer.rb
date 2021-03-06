class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :actual_temp,
              :current_time_month_day,
              :feels_like,
              :high_temp,
              :hourly_weather_forecast,
              :humidity,
              :low_temp,
              :sunrise_time,
              :sunset_time,
              :uv_index,
              :visibility,
              :weather_description,
              :week_weather_forecast
  set_id :null
end
