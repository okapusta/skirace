class Injector
  include Dependor::AutoInject
  include Dependor::Sinatra::Objects

  look_in_modules ::Repositories, 
  ::Connections, 
  ::RaspberryPi,
  ::Presenters,
  ::Uploaders,
  ::Parsers,
  ::Components

  def initialize(objects = nil)
    sinatra_objects(objects)

    io.wiringPiSetup
  end
end
