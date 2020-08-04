class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image
  set_id :null
end
