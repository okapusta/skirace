class TokenService
  takes :secure_random

  def generate_auth_token
    secure_random.hex(8)
  end
end