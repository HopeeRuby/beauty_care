class UsersController < ApplicationController

	# http post
	def index
	  @users =User.page(params[:page]).per_page 10
	end

  def show
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
  end

end
