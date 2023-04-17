Rails.application.routes.draw do
  
  #deviseのモデル作成に伴う、ルーティングの自動作成
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #「/」でトップページを表示できるようにする
  root to: 'homes#top'
  
  #aboutのresourcesメソッド
  #resources :abouts
  get '/home/about' => 'homes#about' 
  
  #投稿のルーティングをresorcesメソッドに書き換え
  #get 'posts/new'
  #get 'posts/index'
  #get 'posts/show'
  #get 'posts/edit'
  resources :posts, only: [:new, :index, :show, :edit]
  
end
