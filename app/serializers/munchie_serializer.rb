class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_location, :end_location, :destination_forecast, :restaurant
    set_id :null
end
