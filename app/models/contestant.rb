class Contestant < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:contestants])

  plugin :validation_helpers

  def validate
    super
    validates_presence :first_name
    validates_presence :last_name
  end

end