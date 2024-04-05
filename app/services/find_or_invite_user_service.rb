class FindOrInviteUserService < ApplicationService
  def initialize(email:, inviter:)
    @email = email
    @inviter = inviter
  end

  def call
    user = User.find_by(email: @email)
    return user if user

    User.invite!({email: @email}, @inviter)
  end
end
