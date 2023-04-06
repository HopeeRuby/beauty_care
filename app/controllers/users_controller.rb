class UsersController < ApplicationController

	# http post
	def index
	  @users = User.all.page(params[:page]).per_page 10
	end

  def show
  	@user = User.find(params[:id])
  end

  # http post
  def create
    @user = User.new user_params
    @user.save
    redirect_to users_path
  end
  
  # http get
  def new
    @user = User.new
  end

  # http get
  def edit
    @user = User.find(params[:id])
  end

  # http put/patch
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to users_path
  end

  # http delete
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :company_id)
  end

end
