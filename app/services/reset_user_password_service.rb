class ResetUserPasswordService < ApplicationService
  def initialize(user:)
    @user = user
  end

  def call
    if @user.update(
      reset_password_token: SecureRandom.hex(20)
    )
      UserMailer.with(user: @user).forgotten_password.deliver_now
    end
  end
end
