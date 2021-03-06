require 'rails_helper'

RSpec.describe "Weather API Service" do
  it "Returns a restaurant based on lat and lon" do
    service = YelpService.new

    lat = 39.738453
    long = -104.984853
    food_type = "Asian"

    body = service.get_restaurants_by_end_location(lat, long, food_type)

    # binding.pry
    expect(body[:businesses]).to be_an(Array)
    expect(body[:businesses][0][:location][:display_address]).to be_an(Array)
    expect(body[:businesses][0][:name]).to be_a(String)
    expect(body.keys).to eq([:businesses, :total, :region])
  end
end