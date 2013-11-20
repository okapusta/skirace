class Injector
  include Dependor::AutoInject

  look_in_modules Repositories

  def initialize(opts = {})
  end
end