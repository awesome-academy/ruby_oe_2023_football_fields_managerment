class Admin::BaseController < ApplicationController
  before_action :require_login

  layout "layouts/application_admin"

  private

  def require_login
    return if logged_in? && current_user.admin?

    flash[:warning] = t "notification.notadmin"
    redirect_to root_path
  end
end
