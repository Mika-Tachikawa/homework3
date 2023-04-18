#投稿専用画面が不要だった場合、このファイルも不要

class PostsController < ApplicationController
  def new
    #@post = Post.all
  end

  def index
  end

  def show
  end

  def edit
  end
end
