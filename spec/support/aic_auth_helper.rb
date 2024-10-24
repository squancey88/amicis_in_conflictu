module AicAuthHelper
  def sign_in(user)
    post auth_authenticate_url(params: {email: user.email, password: user.password})
  end
end
