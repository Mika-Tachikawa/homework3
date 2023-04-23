class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id]) 
    @books = @user.books.page(params[:page])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render :users
    end
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params)  # データ（レコード）を編集
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  def index
    #データ全てを取得するためのインスタンス変数
    @users = User.all
    @user = User.new
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
