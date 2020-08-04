class Api::V1::MunchiesController < ApplicationController
  def index
    binding.pry
    render json: MunchieSerializer.new
  end
end