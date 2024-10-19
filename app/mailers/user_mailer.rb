class UserMailer < ApplicationMailer
  after_deliver :set_invite_sent, only: [:invite]
  after_deliver :set_reset_sent, only: [:forgotten_password]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite.subject
  #
  def invite
    @user = params[:user]

    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgotten_password.subject
  #
  def forgotten_password
    @user = params[:user]

    mail to: @user.email
  end

  private

  def set_reset_sent
    user = params[:user]
    user.reset_password_sent_at = DateTime.now
    user.save!
  end

  def set_invite_sent
    user = params[:user]
    user.invitation_sent_at = DateTime.now
    user.save!
  end
end
