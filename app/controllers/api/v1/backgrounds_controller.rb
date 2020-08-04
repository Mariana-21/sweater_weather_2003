class Api::V1::BackgroundsController < ApplicationController
  def index 
    render json: BackgroundImageSerializer.new
  end
end