class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_days
  has_one_attached :image

  validates :image,            presence: true
  validates :name,             presence: true, length: { maximum: 40 }
  validates :content,          presence: true, length: { maximum: 1000 }
  validates :condition_id,     presence: true
  validates :prefecture_id,    presence: true
  validates :category_id,      presence: true
  validates :delivery_fee_id,  presence: true
  validates :delivery_days_id, presence: true
  validates :price,            presence: true,
                               format: { with: /\A[0-9]+\z/,
                                         message: '半角数字を使用してください' },
                               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :delivery_days_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one  :order
  
end
