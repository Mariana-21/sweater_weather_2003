require 'rails_helper'

RSpec.describe "Geocoding Service" do
  it "Can get lat and lon from data" do
    service = GeocodingService.new
    location = 'Denver,CO'
    body = service.location_lat_long(location)

    expect(body[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
    expect(body[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
  end
end