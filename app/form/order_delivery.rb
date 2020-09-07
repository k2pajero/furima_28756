class OrderDelivery

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :tell, :building_name, :token, :order_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :postal_code, format: {
      with: /\A[0-9]{3}[-][0-9]{4}\z/, messsgge: "「-」も入力してください"}
    validates :city
    validates :address
    validates :tell, format: {
      with: /\A[0-9]+\z/, message: "半角数字で入力してください。「-」は不要です"},
      length: { maximum: 11 }
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tell: tell, order_id: order.id)
  end
end