class PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per_page 10
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def show
  end

  def update
  end
end
