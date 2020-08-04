require 'rails_helper'

RSpec.describe "Weather API Service" do
  it "Returns weather based on lat and lon" do
    service = WeatherService.new

    lat = 39.738453
    lon = -104.984853

    body = service.location_weather(lat, lon)

    expect(body[:timezone]).to eq("America/Denver")
    expect(body[:current][:sunrise]).to be_a(Integer) 
    expect(body[:current][:sunset]).to be_a(Integer) 
    expect(body[:current][:temp]).to be_a(Float) 
    expect(body[:current][:feels_like]).to be_a(Float) 
    expect(body[:current][:humidity]).to be_a(Integer) 
    expect(body[:current][:visibility]).to be_a(Integer) 
    expect(body[:current][:uvi]).to be_a(Float) 
  end
end