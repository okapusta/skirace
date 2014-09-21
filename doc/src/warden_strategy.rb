Warden::Strategies.add(:password) do
  def valid?
    @params = parse_params
    @params['username'] && @params['password']
  end

  def authenticate!
    user = injector.user_repository.get_by_username(@params['username'])

    if injector.authentication_service.authenticate(user, @params['password'])
      success!(user)
    else
      fail!
    end
end
