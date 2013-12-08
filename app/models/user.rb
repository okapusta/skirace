class User < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:users])

  def admin?

  end
end