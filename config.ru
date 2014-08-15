require './application'

unless ENV['RACK_ENV'] == 'production'
  map Skirace::Application.assets_prefix do
    run Skirace::Application.sprockets
  end
end

map '/' do
  Skirace::Application.set :environment, ENV['RAKE_ENV']
  run Skirace::Application
end
