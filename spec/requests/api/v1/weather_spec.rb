require 'rails_helper'

RSpec.xdescribe "Weather API" do
  it "sends weather for a city" do
    get '/api/v1/forecast?location=denver,co'

    # binding.pry
    body = JSON.parse(response.body, symbolize_names: true)
  end 
end
