require 'rails_helper'

RSpec.describe MunchieResults do
  describe 'class methods' do
    it "rest_data" do
      lat = 38.2401504516602
      long = -104.643249511719
      food_type = "Mexican"

      results = MunchieResults.new.rest_data(lat, long, food_type)

      expect(results[:businesses]).to be_an(Array)
      expect(results[:businesses][0][:location][:display_address]).to eq(["223 E Northern Ave", "Pueblo, CO 81006"])
      expect(results[:businesses][0][:name]).to eq("Tacos Navarro")
      expect(results.keys).to eq([:businesses, :total, :region])
    end
    # binding.pry
  end
end