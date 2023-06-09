Rails.application.routes.draw do

  #deviseのモデル作成に伴う、ルーティングの自動作成
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #「/」でトップページを表示できるようにする
  root to: 'homes#top'
  
  #aboutのresourcesメソッド
  #resources :abouts
  #get 'home/about' => 'homes#about', as: 'about'
  get '/home/about' => 'homes#about', as: 'about'
  
  #投稿のルーティングをresorcesメソッドに書き換え 
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  resources :books#, only: [:new, :create, :show, :index, :edit]
  #データを追加(保存)するためのルーティング
  #post'books' => 'books#create'
  #showアクションのルーティングを追加、投稿データ別
  #名前付きルート(as: '')
  #get 'books/:id' => 'books#show'
  #resources使用のため下記不要？
  #get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  #patch 'books/:id' => 'books#update', as: 'update_book'
  #delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
  #投稿のルーティングをresorcesメソッドに書き換え 
  #get 'users/edit'
  resources :users, only: [:show, :edit, :index, :update]
  #patch 'users/:id' => 'users#update', as: 'update_user'
  #投稿のルーティングをresorcesメソッドに書き換え
  #get 'posts/new'
  #get 'posts/index'
  #get 'posts/show'
  #get 'posts/edit'
  #resources :posts, only: [:new, :index, :show, :edit]
  

  
end
