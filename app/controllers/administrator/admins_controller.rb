# frozen_string_literal: true

module Administrator
  class AdminsController < Administrator::BaseController
    before_action :authorize_admin
    before_action :set_admin, only: %i[show edit update destroy]

    def index
      @admins = if params[:search].present?
                  search_admins
                else
                  paginate_admins(@admins)
                end
    end

    def show; end

    def new
      @admin = Admin.new
    end

    def edit; end

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
      if @admin.update(admin_params)
        flash[:success] = I18n.t('flash.admin.success.update')
        redirect_to administrator_admin_path(@admin)
      else
        render 'edit'
      end
    end

    def destroy
      @admin.destroy
      redirect_to administrator_admins_path
    end

    private

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :phone)
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def authorize_admin
      authorize current_admin
    end

    def search_admins
      Admin.where('email LIKE ? OR phone LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
           .page(params[:page])
           .paginate(page: params[:page], per_page: 10)
    end

    def paginate_admins(_admins)
      Admin.paginate(page: params[:page], per_page: 10)
    end
  end
end
