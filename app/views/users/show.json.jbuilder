json.extract! @user, :id, :firstname, :surname, :nickname
json.url user_url(@user, format: :json)
