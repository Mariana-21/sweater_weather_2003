require 'rails_helper'

RSpec.describe LocationResults do
  describe 'class methods' do
    location = "Denver,CO"
    results = LocationResults.new.get_lat_long_by_city(location)



    # binding.pry
  end
end