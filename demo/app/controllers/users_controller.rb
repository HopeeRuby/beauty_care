class UsersController < ApplicationController

  # GET method
  def index
    @user = User.all
  end

  # POST method
  def create
    @user = User.create(params.require(:user).permit(:user, :email))
  end

  # GET method
  def new
    @user = User.new
  end

  # GET method
  def edit

  end

  # PATCH/ PUT method
  def update
  end

  # DELETE method
  def destroy
  end

  # GET method
  def show
    @user = User.where(name: ['Angel Reichert', 'Porfirio Ferry'])
  end

  def login
  end

end
