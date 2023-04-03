class UsersController < ApplicationController
  # http get
  def index
    @users = User.includes(:company).all
  end

  # http post
  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  # http get
  def new
    @user = User.new
  end

  # http get
  def edit
  end

  # http get
  def show
    @user = User.includes(:company).find(params[:id])
  end

  # http put/patch
  def update
  end

  # http delete
  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :company_id, :active)
  end
end
