require 'rails_helper'

RSpec.describe "Munchies api endpoint" do
  it 'can give back all info needed for that location' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
  end
end