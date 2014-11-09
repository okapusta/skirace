class User < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:users])

  def admin?
    admin
  end

  def self.exists?(params)
    !find(params).nil?
  end
end 