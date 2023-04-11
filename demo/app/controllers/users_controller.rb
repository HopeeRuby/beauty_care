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
    @user = User.new(user_params)
    if @user.save
      flash[:errors] = 'User have been sucessfully created'
      redirect_to users_path
    else
      flash.now[:errors] = 'You could not save user'
      render :new
    end  
  end

  # http GET
  def edit
    @user = User.find(params[:id])
  end

  # http PATCH
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "User have been successfully updated"
      redirect_to users_path
    else
      flash.now[:error] = "Failed to save user"
      render action: 'edit'
    end
  end

  # http DELETE
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = 'Succesfully destroy user!!!'
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
