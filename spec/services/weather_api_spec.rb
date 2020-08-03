require 'rails_helper'

RSpec.describe "Weather API Service" do
  it "Returns weather based on lat and lon" do
    service = WeatherService.new

    lat = 39.738453
    lon = -104.984853

    body = service.location_weather(lat, lon)

    expect(body[:timezone]).to eq("America/Denver")
  end
end