require 'rails_helper'

RSpec.describe "Weather API" do
  it "sends weather for a city" do
    get '/api/v1/forecast?location=denver,co'

    # binding.pry
    body = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    # expect(body.keys).to eq([:forecast, :hourly, :daily])    
  end 
end
