class Contestant < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:contestants])

end