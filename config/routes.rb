Rails.application.routes.draw do
  
  #deviseのモデル作成に伴う、ルーティングの自動作成
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #「/」でトップページを表示できるようにする
  root to: 'homes#top'
  
end
