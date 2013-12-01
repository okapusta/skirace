require 'bundler/setup'
require 'dependor/shorty'

Bundler.require

module Repositories; end
module Skirace
  
  auto_load_paths = %w(../app/**/*.rb ../lib/**/*.rb).each do |path|
    Dir[File.expand_path(path, __FILE__)].each do |file|
      require file
    end
  end
    
  class Application < Sinatra::Base
    
    set :sprockets, Sprockets::Environment.new(root)
    set :precompile, [ /\w+\.(?!js\.coffee).+/, /application\.js$/ ]
    set :assets_prefix, '/assets'
    set :digest_assets, true
    set(:assets_path)   { File.join public_folder, assets_prefix }   
    
    set :static, :enable
    set :views, Proc.new { File.join(root, "app", "views") }
    set :public_folder, File.join(root, "public")
   
    helpers do
      include ApplicationHelper
      include TimeHelper
      include Sprockets::Helpers
    end  

    injector do |objects| 
      Injector.new(objects) 
    end

    configure do
      sprockets.append_path File.join(root, 'app', 'assets', 'javascripts')
      sprockets.append_path File.join(root, 'app', 'assets', 'stylesheets')
      sprockets.append_path File.dirname(HamlCoffeeAssets.helpers_path)

      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix      = assets_prefix
        config.digest      = digest_assets
        config.public_path = public_folder
      end
    end

    get '/' do
      haml "home/index".to_sym, layout: :website
    end

    get '/contestants' do |contestant_presenter, db_contestant|
      contestant_presenter.as_json(db_contestant.all)
    end

    post '/contestants' do |json_parser, contestant_repository|
      content_type :json
      params = json_parser.parse(request.body.read)
      contestant = contestant_repository.build(params)
      if contestant_repository.save(contestant)
        status 200
      else
        status 422
      end
    end
  end
end