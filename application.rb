require 'bundler/setup'
require 'dependor/shorty'
require 'sinatra/asset_pipeline'

Bundler.require(:default)

module Skirace

  Dir[File.expand_path("../app/**/*.rb", __FILE__)].each do |file|
    require file
  end

  class Application < Sinatra::Base
    
    set :assets_precompile, %w(application.js application.css *.png *.jpg)
    set :assets_prefix, %w(app/assets)
    set :assets_js_compressor, :uglifier
    set :assets_css_compressor, :sass

    set :static, :enable
    set :views, Proc.new { File.join(root, "app", "views") }
    set :public_folder, File.join(root, "public")
    
    register Sinatra::AssetPipeline
       
    configure :development, :production do
      require 'uglifier'
      sprockets.js_compressor = Uglifier.new(mangle: true)
    end

    if defined? ::HamlCoffeeAssets
      HamlCoffeeAssets.config do |config|
        config.hamlcoffee.awesome = true
        config.hamlcoffee.placement = 'amd'
        config.hamlcoffee.namespace = 'window.HAML'
      end
    end

    helpers ApplicationHelper 
    helpers TimeHelper
    helpers FormHelper

    injector { |objects| Injector.new(objects) }


    get '/' do
      haml "home/index".to_sym, layout: :website
    end

    get '/contestants' do |contestant_presenter, db_contestant|
      content_type :json
      contestant_presenter.as_json(db_contestant.all)
    end
  end
end
