class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数文字を使用してください' }
  validates :real_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :real_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :reading_family_name, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナ文字を使用してください' }
  validates :reading_first_name, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナ文字を使用してください' }
  validates :birthday, presence: true

  has_many :items
end
