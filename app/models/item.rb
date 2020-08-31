class Item < ApplicationRecord

  validates :user,             presence: true
  validates :image,            presence: true
  validates :name,             presence: true
  validates :content,          presence: true
  validates :condition_id,     presence: true
  validates :prefection_id,    presence: true
  validates :category_id,      presence: true
  validates :delivery_fee_id,  presence: true
  validates :delivery_days_id, presence: true
  validates :price,            presence: true, format: {
     with: /\A[0-9]+\z/, 
     message: '半角数字を使用してください' 
    #  ¥300~¥9,999,999未実装
    }
end
