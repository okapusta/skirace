require 'sequel'

class Contestant < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:contestants])

  def calculated_end_time
    self.end_time_at - self.start_time_at if self.end_time_at
  end
end