require 'bundler/setup'
require 'dependor/shorty'

Bundler.require

module Repositories; end
module Connections; end
module RaspberryPi; end
module Presenters; end 
module Components; end
module Uploaders; end
module Parsers; end
module Skirace; end
  
auto_load_paths = %w(../app/**/*.rb ../lib/**/*.rb).each do |path|
  Dir[File.expand_path(path, __FILE__)].each do |file|
    next if file.include?('routes')

    require file
  end
end
    
class Skirace::Application < Sinatra::Base
  
  set :static, :enable
  set :views, Proc.new { File.join(root, "app", "views") }
  set :public_folder, File.join(root, "public")
  set :assets_prefix, '/assets'
  set :assets_path, File.join(public_folder, assets_prefix)
  
  set :sprockets, Sprockets::Environment.new(root)
  set :precompile, [ /\w+\.(?!js\.coffee).+/, /application\.js$/ ]
  set :digest_assets, true
     
 
  helpers do
    include ApplicationHelper
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
    use Rack::Session::Memcache, memcache_server: 'localhost:11211', namespace: 'skirace' 

    use Warden::Manager do |config|
      
      config.serialize_into_session do |user|
        user.auth_token
      end

      config.serialize_from_session do |token|
        User.find(auth_token: token)
      end

      config.scope_defaults :default, strategies: [:password], action: '/forbidden'
      config.failure_app = self
    end

    Warden::Strategies.add(:password) do
      def valid?
        @params = parse_params
        @params['username'] && @params['password']
      end

      def authenticate!
        user = injector.user_repository.get_by_username(@params['username'])

        if injector.authentication_service.authenticate(user, @params['password']).success
          success!(user)
        else
          fail!
        end
      end

      private

        def injector
          @injector ||= Injector.new(OpenStruct.new(params: @params))
        end

        def parse_params
          injector.json_parser.parse(request.body.read)
        rescue
          {}
        end

    end

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

  get '/forbidden' do
    haml :forbidden 
  end
end

require_relative 'app/routes/login'
require_relative 'app/routes/users'
require_relative 'app/routes/export'
require_relative 'app/routes/import'
require_relative 'app/routes/settings'
require_relative 'app/routes/contests'
require_relative 'app/routes/contestants'