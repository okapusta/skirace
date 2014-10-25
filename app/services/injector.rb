require 'bcrypt'

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
    sinatra_objects(objects) if objects

    io.wiringPiSetup
  end

  def db_contestant
    Contestant
  end

  def db_contest
    Contest
  end

  def db_user
    User
  end

  def db_settings
    Settings
  end
    
  def json_parser
    JSON
  end

  def xml
    Nokogiri::XML
  end

  def csv
    CSV
  end

  def yaml
    YAML
  end

  def file
    File
  end

  def dir
    Dir
  end

  def io
    Wiringpi
  end

  def hash
    Skirace::Hash.new
  end

  def secure_random
    SecureRandom
  end

  def bcrypt_password
    BCrypt::Password
  end

  def dalli_client
    Dalli::Client
  end

  def time
    Time
  end

  def current_path
    ENV['BUNDLE_GEMFILE'].gsub('Gemfile','')
  end
end