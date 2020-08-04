require 'rails_helper'

RSpec.describe "User Creation" do
  it "User Registration" do
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post "/api/v1/users", params: user_params

    expect(response).to be_successful

    user_registration = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user_registration).to have_key(:data)
    expect(user_registration[:data]).to have_key(:type)
    expect(user_registration[:data]).to have_key(:id)
    expect(user_registration[:data]).to have_key(:attributes)

    expect(user_registration[:data]).to_not eq(nil)
    expect(user_registration[:data][:type]).to eq("users")
    expect(user_registration[:data][:id]).to_not eq(nil)
    expect(user_registration[:data][:attributes]).to_not eq(nil)
    expect(user_registration[:data][:attributes][:email]).to_not eq(nil)
    expect(user_registration[:data][:attributes][:api_key]).to_not eq(nil)
  end
end