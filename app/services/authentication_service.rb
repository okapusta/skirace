class AuthenticationService
 takes :hashing_service

  def authenticate(user, password)
    return if user.nil? || password.empty?
    if hashing_service.new(user.encrypted_password) == password
      return authentication_result(true, user.auth_token)
    end
    authentication_result(false)
  end

  private

    def authentication_result(success, auth_token = nil)
      return false unless success
      
      OpenStruct.new({success: success, auth_token: auth_token})
    end
end