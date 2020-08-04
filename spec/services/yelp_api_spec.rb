require 'rails_helper'

RSpec.describe "Weather API Service" do
  it "Returns a restaurant based on lat and lon" do
    service = YelpService.new

    lat = 39.738453
    long = -104.984853
    food_type = "Asian"

    body = service.get_restaurants_by_end_location(lat, long, food_type)

    binding.pry
    expect(body[:businesses]).to be_an(Array)
    # expect(body[:current][:sunrise]).to be_a(Integer) 
    # expect(body[:current][:sunset]).to be_a(Integer) 
    # expect(body[:current][:temp]).to be_a(Float) 
    # expect(body[:current][:feels_like]).to be_a(Float) 
    # expect(body[:current][:humidity]).to be_a(Integer) 
    # expect(body[:current][:visibility]).to be_a(Integer) 
    # expect(body[:current][:uvi]).to be_a(Float) 
  end
end
=> [{:id=>"gN8o-SG2PgCQGYrOCkkqng",
  :alias=>"liangs-thai-food-denver",
  :name=>"Liang's Thai Food",
  :image_url=>"https://s3-media3.fl.yelpcdn.com/bphoto/ks0Ob7IG7bnM-Wstz1fyxg/o.jpg",
  :is_closed=>false,
  :url=>
   "https://www.yelp.com/biz/liangs-thai-food-denver?adjust_creative=_jLZbUE2_SfXXws4VngCtQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=_jLZbUE2_SfXXws4VngCtQ",
  :review_count=>347,
  :categories=>[{:alias=>"thai", :title=>"Thai"}],
  :rating=>4.5,
  :coordinates=>{:latitude=>39.7433636089573, :longitude=>-104.989760469717},
  :transactions=>["delivery"],
  :price=>"$",
  :location=>
   {:address1=>"500 16th St",
    :address2=>"",
    :address3=>"",
    :city=>"Denver",
    :zip_code=>"80202",
    :country=>"US",
    :state=>"CO",
    :display_address=>["500 16th St", "Denver, CO 80202"]},
  :phone=>"+17208108693",
  :display_phone=>"(720) 810-8693",
  :distance=>688.6350810238093}]