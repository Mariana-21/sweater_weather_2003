class Api::V1::BackgroundsController < ApplicationController
  def index 
    render json: BackgroundImageSerializer.new(get_background_image)
  end

  private

    def get_background_image
      location = params[:location]
      UnsplashService.new.get_image(location)
    end
end