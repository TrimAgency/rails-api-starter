module AuthHelper
  def token_for(user)
    Knock::AuthToken.new(payload: { sub: user.id }).token
  end

  def auth_headers_for(user)
    "Bearer #{token_for(user)}"
  end

  def non_auth_headers
    "Bearer "
  end
end