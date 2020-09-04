class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :order
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
end
