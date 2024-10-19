class ApplicationController < ActionController::Base
  include AuthHelper

  before_action :authenticate_user

  protected

  def authenticate_user
    redirect_to login_path unless current_user
  end

  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end
