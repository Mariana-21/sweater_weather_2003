class UnsplashService 
  def get_image_based_on_location(location)
    response = conn.get('search/photos') do |r|
      r.params[:query] = location
      r.params[:per_page] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_image(location)
    image_info = get_image_based_on_location(location)
    BackgroundImageResults.new(image_info)
  end
  
  private
    def conn
      Faraday.new('https://api.unsplash.com/') do |f|
        f.params[:client_id] = ENV['UNSPLASH_KEY']
      end
    end
end