require 'rails_helper'

RSpec.describe "Geocoding Service" do
  it "Can get lat and lon from data" do
    service = Geocoding.new
    location = 'Denver,CO'
    body = service.location_lat_lon(location)

    expect(body[:results][0][:locations][:latLng][:lat]).to be_a(Float)
    expect(body[:results][0][:locations][:latLng][:lng]).to be_a(Float)
  end
end