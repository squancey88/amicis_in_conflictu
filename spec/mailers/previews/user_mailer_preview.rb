# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user/invite
  def invite
    UserMailer.with(user: User.first).invite
  end

  # Preview this email at http://localhost:3000/rails/mailers/user/forgotten_password
  def forgotten_password
    UserMailer.with(user: User.first).forgotten_password
  end
end
