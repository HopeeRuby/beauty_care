class UsersController < ApplicationController

  # http GET
  def index
    @users = User.all.page(params[:page]).per_page 10
  end

  # http GET
  def new
    @user = User.new
  end

  # http POST
  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  # http GET
  def edit
    @user = User.find(params[:id])
  end

  # http PATCH
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  # http DELETE
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to users_path
  end

  # http GET
  def show
    @user = User.find(params[:id])
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :company_id)
  end

end
