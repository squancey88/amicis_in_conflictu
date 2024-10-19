class FindOrInviteUserService < ApplicationService
  def initialize(email:, inviter:)
    @email = email
    @inviter = inviter
  end

  def call
    user = User.find_by(email: @email)
    return user if user

    invite
  end

  def invite
    new_user = User.create!(
      email: @email,
      invited_by: @inviter,
      invitation_created_at: DateTime.now,
      invitation_token: SecureRandom.hex(20),
      password_migration: SecureRandom.hex(20),
      password: SecureRandom.hex(20)
    )
    UserMailer.with(user: new_user).invite.deliver_now
    new_user
  end
end
