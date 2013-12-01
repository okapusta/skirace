class Injector
  include Dependor::AutoInject
  include Dependor::Sinatra::Objects

  look_in_modules ::Repositories

  def initialize(objects = nil)
    sinatra_objects(objects)
  end

  def db_contestant
    Contestant
  end

  def db_contest
    Contest
  end

  def contestant_presenter
    ContestantPresenter.new
  end

  def contest_presenter
    ContestPresenter.new
  end
  
  def json_parser
    JSON
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

  def hash
    Skirace::Hash.new
  end
end