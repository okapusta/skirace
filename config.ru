require './application'

Skirace::StartingLine.new(ENV['RACK_ENV'])

unless ENV['RACK_ENV'] == 'production'
  map Skirace::Application.assets_prefix do
    run Skirace::Application.sprockets
  end
end

map '/' do
  run Skirace::Application
end
