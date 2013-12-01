class Contest < Sequel::Model(Sequel.sqlite('db/database.sqlite')[:contests])
  plugin :validation_helpers
  one_to_many :contestants
  
  def validate
    super
    validates_presence :name
  end

end