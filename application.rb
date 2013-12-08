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
    
    set :static, :enable
    set :views, Proc.new { File.join(root, "app", "views") }
    set :public_folder, File.join(root, "public")

    set :sprockets, Sprockets::Environment.new(root)
    set :precompile, [ /\w+\.(?!js\.coffee).+/, /application\.js$/ ]
    set :assets_prefix, '/assets'
    set :digest_assets, true
    set(:assets_path)   { File.join public_folder, assets_prefix }   
   
    helpers do
      include ApplicationHelper
      include TimeHelper
      include Sprockets::Helpers
    end  

    injector do |objects| 
      Injector.new(objects) 
    end

    configure :development, :production do
      enable :logging
      log_file = File.new('./log/application.log', 'a+')
      log_file.sync = true
      
      use Rack::CommonLogger, log_file

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

    get '/contestants' do |contestant_presenter, contestant_repository|
      contestant_presenter.as_json(contestant_repository.all)
    end

    get '/contestants/:id' do |contestant_presenter, contestant_repository|
      contestant_presenter.as_json(contestant_repository.get(params[:id]))
    end

    get '/contests' do |contest_presenter, contest_repository|
      contest_presenter.as_json(contest_repository.all)
    end

    get '/contests/:id/contestants' do |contestant_presenter, contest_repository|
      contestants = contest_repository.get(params[:id]).contestants
      contestant_presenter.as_json(contestants)
    end

    get '/export' do |contestant_repository, contestant_presenter|
      case params[:format]
      when 'json'
        content_type 'application/json'
        attachment 'export.json'
        contestant_presenter.as_json(contestant_repository.all)
      when 'csv'
        content_type 'text/csv'
        attachment 'export.csv'
        contestant_presenter.as_csv(contestant_repository.all)
      when 'xml'
        content_type 'text/xml'
        attachment 'export.xml'
        contestant_presenter.as_xml(contestant_repository.all)
      else
        status 404
      end
    end

    post '/contestants' do |hash, json_parser, contestant_repository|
      content_type :json
      params = hash.with_indifferent_access(json_parser.parse(request.body.read))
      contestant = contestant_repository.build(params)
      if contestant_repository.save(contestant)
        status 200
      else
        status 422
      end
    end

    post '/contests' do |json_parser, contest_repository|
      content_type :json
      params = json_parser.parse(request.body.read)
      contest = contest_repository.build(params)
      if contest_repository.save(contest)
        status 200
      else
        status 422
      end
    end
  end
end