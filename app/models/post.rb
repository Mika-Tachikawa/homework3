class Post < ApplicationRecord
  
  #PostモデルーUserモデル　N:1（アソシエーション）
  #複数投稿に対し１ユーザー＝belongs_toメソッド、userは単数形
  belongs_to :user
  
end
