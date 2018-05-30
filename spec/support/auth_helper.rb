module AuthHelper
  def token_for(user)
    Knock::AuthToken.new(payload: { sub: user.id }).token
  end

  def auth_headers_for(user)
    {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{token_for(user)}"
    }
  end

  def non_auth_headers
    {
        'Content-Type' => 'application/json'
    }
  end
end