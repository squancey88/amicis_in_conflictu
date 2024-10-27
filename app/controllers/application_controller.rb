class ApplicationController < ActionController::Base
  include AuthHelper

  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :authenticate_user

  protected

  def json_request?
    request.format.json?
  end

  def authenticate_user
    unless current_user
      if json_request?
        render json: {error: "Not authenticated"}, status: :unauthorized
      else
        redirect_to login_path
      end
    end
  end

  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end
