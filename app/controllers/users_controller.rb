class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]) 
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def index
    #データ全てを取得するためのインスタンス変数
    @users = User.all
  end
  
end
