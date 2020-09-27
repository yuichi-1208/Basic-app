class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  # パスワードをハッシュ化する。
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # 下記はアソシエーション。アソシエーション名（ここでいうとblogs）はメソッドになる。
  has_many :blogs
  has_many :favorites, dependent: :destroy 
end
