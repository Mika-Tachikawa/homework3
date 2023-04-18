class UsersController < ApplicationController
  def show
    #あまり自信がない、15章
    @user = User.find(params[:id]) 
    @books = @user.books
  end

  def edit
  end
end
