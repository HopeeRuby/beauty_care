class UsersController < ApplicationController
  # http get
  def test
    @user = User.all
  end

  def index
    @users = User.includes(:company).page(params[:page]).per_page 10
  end

  # http post
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully"
      redirect_to users_path
    else
      flash.now[:warning] = "Please fill in all required fields"
      render :new
    end
  end

  # http get
  def new
    @user = User.new
  end

  # http get
  def edit
    @user = User.find(params[:id])
  end

  # http get
  def show
    @user = User.includes(:company).find(params[:id])
  end

  # http put/patch
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User update successfully"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  # http delete
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :company_id, :active)
  end
end
