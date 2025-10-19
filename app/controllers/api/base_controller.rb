class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user
  before_action :authenticate_api_access

  protected

  def authenticate_api_access
    unless current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by(key: token)
        next false if key.nil? || key.expired?

        @current_user = key.created_by
        true
      end
    end
  end
end
