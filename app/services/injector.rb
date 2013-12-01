class Injector
  include Dependor::AutoInject
  include Dependor::Sinatra::Objects

  def initialize(objects = nil)
    sinatra_objects(objects)
  end

  def db_contestant
    Contestant
  end

  def contestant_presenter
    ContestantPresenter.new
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