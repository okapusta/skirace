require 'sequel'

class Contestant < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:contestants])

  plugin :validation_helpers

  def validate
    super
    validates_presence :first_name#, message: "Imie nie moze byc puste"
    validates_presence :last_name#, message: "Nazwisko nie moze byc puste"
  end

  def calculated_end_time
    self.end_time_at - self.start_time_at if self.end_time_at
  end
end