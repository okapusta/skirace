class AuthenticationService
 takes :hashing_service

  def authenticate(user, password)
    return false if user.nil? || password.empty?
    if hashing_service.new(user.encrypted_password) == password
      return OpenStruct.new({authenticated: true, auth_token: user.auth_token})
    end
    false
  end
end