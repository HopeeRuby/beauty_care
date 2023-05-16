# frozen_string_literal: true

class UsersController < ApplicationController
  include BreadcrumbsOnRails::ActionController
  layout 'admin/application'

  before_action :set_user, only: %i[show edit update destroy]
  add_breadcrumb 'Home', :administrator_root_path
  add_breadcrumb 'Users', :users_path

  def index
    @users = User.all
    if params[:search].present?
      @users = @users.where("CONCAT(first_name, ' ', last_name) LIKE ? OR email LIKE ?",
                            "%#{params[:search]}%", "%#{params[:search]}%")
    end
    @users = @users.paginate(page: params[:page], per_page: 10)
  end

  def show
    add_breadcrumb 'User informations'
  end

  def new
    add_breadcrumb 'Add new User'
    @user = User.new
  end

  def edit
    add_breadcrumb 'Edit user'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = I18n.t('flash.user.success.create')
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Edit User'
    if @user.update(user_params)
      flash[:success] = I18n.t('flash.user.success.update')
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    permit_params = params.require(:user).permit(:first_name, :last_name, :email, :phone,
                                                 :gender, :status, :avatar, :address)
    permit_params = permit_params.merge(password: params[:user][:password]) if params[:user][:password].present?
    permit_params
  end

  def set_user
    @user = User.find(params[:id])
  end
end
