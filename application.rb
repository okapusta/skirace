require 'bundler/setup'
require 'sinatra/asset_pipeline'

Bundler.require(:default)

module Skirace

  Dir["./app/models/*.rb"].each do |file|
    require file
  end

  Dir["./app/helpers/*.rb"].each do |file|
    require file
  end 

  Dir["./app/controllers/*.rb"].each do |file|
    require file
  end 

  Dir["./lib/*.rb"].each do |file|
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

    helpers ApplicationHelper 
    helpers Forms

    get '/' do
      @cont = Contestant.all
      haml "home/index".to_sym, layout: :website
    end
  end
end
