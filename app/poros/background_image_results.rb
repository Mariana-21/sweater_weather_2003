class BackgroundImageResults 
  attr_reader :image

  def initialize(query_params)
    @image = query_params[:results][0][:urls][:raw]
  end

  def null
    "null"
  end
end