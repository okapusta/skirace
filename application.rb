require 'bundler/setup'
require 'dependor/shorty'

Bundler.require

module Skirace

  Dir[File.expand_path("../app/**/*.rb", __FILE__)].each do |file|
    require file
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
      include FormHelper
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
      content_type :json
      contestant_presenter.as_json(db_contestant.all)
    end
  end
end
