class UsersController < ApplicationController

	# http post
	def index
	  @users = User.all.page(params[:page]).per_page 10
	end

  def show
  	@users = User.find(params[:id])
  end

  # http post
  def create
  end
  
  # http get
  def new
  end

  # http get
  def edit
  end

  # http put/patch
  def update
  end

  # http delete
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  end
end
