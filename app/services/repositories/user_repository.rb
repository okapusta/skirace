class Repositories::UserRepository
  takes :db_user, :hashing_service, :token_service
  
  def build(params = {}, role = nil)
    user = db_user.new({username: params['username']})

    user.encrypted_password = hashing_service.digest(params['password'])
    user.auth_token = token_service.generate_auth_token

    user.role_id = if role
      role
    else
      params['admin'] ? 1 : 0
    end

    user
  end

  def save(user)
    user.save
  end

  def get(id)
    db_user.find(id: id)
  end

  def all
    db_user.all
  end

  def get_by_username(username)
    db_user.find(username: username)
  end

  def get_by_auth_token(auth_token)
    db_user.find(auth_token: auth_token)
  end
end