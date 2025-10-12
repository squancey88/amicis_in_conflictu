module AicAuthHelper
  def sign_in(user)
    post auth_authenticate_url(params: {email: user.email, password: user.password})
  end

  def get_auth_token(user)
    post auth_authenticate_token_url(params: {email: user.email, password: user.password})
    data = JSON.parse(response.body)
    data["token"]
  end

  def get_with_token(user, path, params = {})
    token = get_auth_token(user)
    get path, params:, headers: {
      "Authorization" => "Bearer #{token}"
    }
  end
end
