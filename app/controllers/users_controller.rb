class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]) 
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params)  # データ（レコード）を編集
      flash[:notice2] = "You have updated user successfully."
      redirect_to user_path(@user.id)  # ユーザー画面へリダイレクト
    else
      render :edit
    end
  end
  
  def index
    #データ全てを取得するためのインスタンス変数
    @users = User.all
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
