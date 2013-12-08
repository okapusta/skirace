class HashingService
  takes :bcrypt_password, :options

  def new(password)
    bcrypt_password.new(password)
  end
  
  def digest(password)
    bcrypt_password.create(password, cost: options.password_cost)
  end
end