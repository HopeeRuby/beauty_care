# frozen_string_literal: true

module Administrator
  class AdminsController < Administrator::BaseController
    include BreadcrumbsOnRails::ActionController

    before_action :authorize_admin, except: %i[update change_password edit_password]
    before_action :set_admin, only: %i[show edit update destroy]

    add_breadcrumb 'Home', :administrator_root_path
    add_breadcrumb 'Admins', :administrator_admins_path

    def index
      @admins = Admin.all
      if params[:search].present?
        @admins = @admins.where("CONCAT(first_name, ' ', last_name) LIKE ? OR email LIKE ?",
                                "%#{params[:search]}%", "%#{params[:search]}%")
      end
      @admins = @admins.paginate(page: params[:page], per_page: 10)
    end

    def show
      add_breadcrumb 'Admin informations'
    end

    def new
      add_breadcrumb 'Add new admin'
      @admin = Admin.new
    end

    def edit
      add_breadcrumb 'Edit admin'
    end

    def create
      @admin = Admin.new(admin_params)
      if @admin.save
        flash[:success] = I18n.t('flash.admin.success.create')
        redirect_to administrator_admins_path
      else
        render 'new'
      end
    end

    def update
      add_breadcrumb 'Edit admin'
      if @admin.update(admin_params)
        flash[:success] = I18n.t('flash.admin.success.update')
        if current_admin == @admin
          redirect_to profile_administrator_admins_path
        else
          redirect_to administrator_admins_path
        end
      else
        render 'edit'
      end
    end

    def destroy
      @admin.destroy
      redirect_to administrator_admins_path
    end

    def profile
      @admin = current_admin
    end

    def edit_password
      @admin = current_admin
    end

    def change_password
      @admin = current_admin
      if @admin.update_with_password(password_params)
        flash[:success] = I18n.t('flash.admin.success.update_password')
        redirect_to new_admin_session_path
      else
        render 'edit_password'
      end
    end

    private

    def admin_params
      permit_params = params.require(:admin).permit(:first_name, :last_name, :email, :phone, :role, :status, :avatar)
      permit_params = permit_params.merge(password: params[:admin][:password]) if params[:admin][:password].present?
      permit_params
    end

    def password_params
      params.require(:admin).permit(:current_password, :password, :password_confirmation)
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def authorize_admin
      authorize current_admin
    end
  end
end
