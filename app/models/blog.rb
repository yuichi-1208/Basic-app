class Blog < ApplicationRecord
  # 下記はアソシエーション。アソシエーション名はそのままメソッドになる。
  belongs_to :user
  # belongs_toかhas_manyで迷ったら、今いるモデルのテーブルのカラムにuser_id,blog_idの様に〜idというのがあったら、belongs_to。
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, presence: true
  validates :content, presence: true
end
