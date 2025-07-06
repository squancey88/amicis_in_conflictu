class UsersController < ApplicationController
  before_action :set_user, except: %i[emulate_user stop_emulation]
  before_action :check_access, except: %i[emulate_user stop_emulation]
  before_action :verify_admin, only: %i[emulate_user]

  def show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def campaigns
    @campaigns = @user.campaigns.where(**campaign_params)
    respond_to do |format|
      format.json { render "campaigns/index", status: :ok }
    end
  end

  def characters
    @characters = current_user.characters
    @allow_creation = false
    @title = "My Characters"
    render "characters/index"
  end

  def emulate_user
    user_id = params.permit(:user_id)[:user_id]
    if User.find(user_id)
      session[:original_user_id] = session[:user_id]
      session[:user_id] = user_id
    end
    redirect_to request.referer
  end

  def stop_emulation
    if session[:original_user_id]
      session[:user_id] = session[:original_user_id]
      session.delete(:original_user_id)
    end
    redirect_to request.referer
  end

  private

  def check_access
    if request.format.html?
      redirect_to(root_url) unless current_user == @user
    else
      render json: {error: "No access"}, status: :forbidden unless current_user == @user
    end
  end

  def campaign_params
    params.require(:filter).permit(:game_system_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:firstname, :surname, :nickname, :email, :password_migration, :password_migration_confirmation)
  end
end
