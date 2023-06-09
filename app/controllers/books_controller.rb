class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def new
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def index
    #投稿データ全てを取得するためのインスタンス変数
    @books = Book.all
    @book = Book.new
  end

  # 投稿データの保存
  def create
  #@いらない？アプリ開発２章の真ん中下くらい
  #データを受け取り新規登録
    @books = Book.page(params[:page])
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  #DBに保存するsaveメソッド
    if @book.save
  #名前付きルートの記述
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id]) 
    if @book.update(book_params)  # データ（レコード）を編集
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end  
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to '/books'
    end
  end
  
end
