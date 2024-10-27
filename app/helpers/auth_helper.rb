module AuthHelper
  def current_user
    if request.headers["Authorization"]
      user_data = decode_token
      if user_data
        user_id = user_data[0]["user_id"]
      end
    else
      user_id = session[:user_id]
    end
    @current_user ||= User.find_by(id: user_id)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.configuration.jwt_password)
  end

  def decode_token
    header = request.headers["Authorization"]
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, Rails.configuration.jwt_password)
      rescue JWT::DecodeError
        nil
      end
    end
  end
end
