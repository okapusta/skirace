class Role < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:roles])
  one_to_many :users
end