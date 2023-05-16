# frozen_string_literal: true

module Administrator
  class BaseController < ::ApplicationController
    include Pundit::Authorization

    layout 'admin/application'
    before_action :authenticate_admin!
    rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized

    private

    def admin_not_authorized
      render 'access_denied', layout: false
    end

    def pundit_user
      current_admin
    end
  end
end
