class Contestant < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:contestants])

  plugin :validation_helpers

  def validate
    super
    validates_presence :first_name
    validates_presence :last_name
  end

  def calculated_end_time
    self.end_time_at - self.start_time_at if self.end_time_at
  end
end