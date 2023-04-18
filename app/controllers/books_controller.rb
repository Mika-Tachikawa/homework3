class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])  
  end

  # 投稿データの保存
  def create
  #@いらない？アプリ開発２章の真ん中下くらい
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
  #名前付きルートの記述
    redirect_to book_path(book.id)
  end

  def index
    #投稿データ全てを取得するためのインスタンス変数
    @books = Book.all  
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    #flash[:notice3] = "Book was successfully destroyed."
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def edit
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
