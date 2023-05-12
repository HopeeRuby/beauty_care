# frozen_string_literal: true

class UsersController < ApplicationController
  include BreadcrumbsOnRails::ActionController
  layout 'admin/application'

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
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
    if @user.update(admin_params)
      flash[:success] = I18n.t('flash.user.success.update')
      if current_user == @user
        redirect_to profile_users_path
      else
        redirect_to users_path
      end
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
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :role, :status, :avatar, :gender, :password, :address)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
