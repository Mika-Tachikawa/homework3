class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #UserモデルーPostモデル　1:N（アソシエーション）
  #１ユーザーに対し複数投稿＝has_manyメソッド
  #ユーザー削除と同時に投稿記事全削除＝dependent: :destroy
  has_many :posts, dependent: :destroy
  
end
