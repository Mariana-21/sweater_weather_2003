require 'rails_helper'

RSpec.describe "Munchies api endpoint" do
  it 'can give back all info needed for that location' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expected = {
      :null=>"null",
      :start_location=>"Denver",
      :end_location=>"Pueblo",
      :destination_forecast=>{:current=>"Clear", :arrival=>"Clear"},
      :restaurant=>{:name=>"Kan's Kitchen", :address=>"1620 S Prairie Ave"}
    }

    expect(json).to eq(expected)
    expect(json[:keys]).to eq([:null, :start_location, :end_location, :destination_forecast, :restaurant])  
    # binding.pry
  end
end