class OrderDelibery

  include ActiveModel::Model
  # user_idとitem_idは要る？
  attr_accessor :postal_code, :prefecture_id, :city, :address, :tell, :building_name

  # 切り取ったバリデーションをここに移動
  with_options presence: true do
    # validates :order
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :postal_code, format: {
      with: /\A[0-9]{3}[-][0-9]{4}\z/, messsgge: "「-」も入力してください"}
    validates :city,
    validates :address,
    validates :tell, format: {
      with: /\A[0-9]+\z/, message: "半角数字で入力してください。「-」は不要です"},
      length: { maximum: 11 }
  end
  validates :building_name

  def save
    # orderの情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tell: tell, order_id: order.id)
  
  end
end