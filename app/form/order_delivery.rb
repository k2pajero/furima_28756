class OrderDelibery

  include ActiveModel::Model
  # user_idとitem_idは要る？
  attr_accessor :postal_code, :prefecture_id, :city, :address, :tell, :building_name
end