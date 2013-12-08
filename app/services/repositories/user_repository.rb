class Repositories::UserRepository
  takes :db_user, :hashing_service, :token_service
  
  def build(params = {})
    user = db_user.new({username: params[:username]})
    user.encrypted_password = hashing_service.digest(params[:password])
    user.auth_token = token_service.generate_auth_token
    user
  end

  def save(user)
    user.save
  end

  def get(id)
    db_user.find(id: id)
  end
end