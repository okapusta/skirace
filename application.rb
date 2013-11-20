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

  class Application < Sinatra::Base
    
    set :assets_precompile, %w(application.js application.css *.png *.jpg)
    set :assets_prefix, %w(app/assets)
    set :asstest_js_compressor, :uglifier

    set :static, :enable
    set :views, Proc.new { File.join(root, "app", "views") }
    set :public_folder, File.join(root, "public")
    
    register Sinatra::AssetPipeline
    
    configure :development, :production do
      require 'uglifier'
      sprockets.js_compressor = Uglifier.new(mangle: true)
    end

    include ApplicationHelper 

    get '/' do
      @cont = Contestant.new(:first_name => 'oskar', :last_name => 'kapusta', start_time_at: Time.now)
      @cont.save
      @cont
      haml "home/index".to_sym, layout: :website
    end
  end
end
