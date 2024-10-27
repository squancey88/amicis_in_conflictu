class AuthController < ApplicationController
  skip_before_action :authenticate_user

  def login
  end

  def logout
    reset_session
    redirect_to login_url, notice: "Logged out!"
  end

  def invite
    @invitation_token = invite_check_params[:invitation_token]
    if @invitation_token.nil?
      redirect_to root_url
    else
      @user = User.find_by(invitation_token: @invitation_token)
      redirect_to root_url if @user.nil?
    end
  end

  def complete_invite
    if register_params[:invitation_token]
      user = User.find_by(invitation_token: register_params[:invitation_token])
      if user
        if register_params[:password] == register_params[:confirm_password]
          user.complete_invite(register_params[:password])
          redirect_to login_path
        else
          redirect_to invite_url(params: {invitation_token: register_params[:invitation_token]})
        end
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

  def forgot_password
  end

  def request_password_reset
    email = password_reset_request_params[:email]
    user = User.find_by(email:)
    ResetUserPasswordService.call(user:) if user
    redirect_to login_url, notice: "Password reset sent"
  end

  def password_reset
    @reset_password_token = reset_params[:reset_password_token]
    if @reset_password_token.nil?
      redirect_to root_url
    else
      @user = User.find_by(reset_password_token: @reset_password_token)
      redirect_to root_url if @user.nil?
    end
  end

  def complete_password_reset
    if reset_params[:reset_password_token]
      user = User.find_by(reset_password_token: reset_params[:reset_password_token])
      if user
        if reset_params[:password] == reset_params[:confirm_password]
          user.reset_password(reset_params[:password])
          redirect_to login_path
        else
          redirect_to forgot_password_url(params: {reset_password_token: reset_params[:reset_password_token]})
        end
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

  def authenticate
    user = User.find_for_authentication(email: login_params[:email])
    if user
      if user.valid_password?(login_params[:password])
        user.migrate_to_secure_password(login_params[:password])
        session[:user_id] = user.id
        redirect_to "/"
      else
        redirect_to login_url, alert: "Incorrect email or password"
      end
    else
      redirect_to login_url, alert: "Incorrect email"
    end
  end

  def authenticate_token
    user = User.find_for_authentication(email: login_params[:email])
    if user
      if user.valid_password?(login_params[:password])
        render json: {
          token: encode_token({
            user_id: user.id,
            exp: 8.hours.from_now.to_i
          })
        }
      else
        render json: {
          error: "Invalid login"
        }
      end
    else
      render json: {
        error: "Invalid login"
      }
    end
  end

  private

  def password_reset_request_params
    params.permit(:email)
  end

  def login_params
    params.permit(:email, :password)
  end

  def invite_check_params
    params.permit(:invitation_token)
  end

  def register_params
    params.permit(:invitation_token, :password, :confirm_password)
  end

  def reset_params
    params.permit(:reset_password_token, :password, :confirm_password)
  end
end
