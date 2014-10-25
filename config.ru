require './application'

Skirace::StartingLine.new(ENV['PWD'] || ENV['BUNDLE_GEMFILE'].gsub('Gemfile',''))

unless ENV['RACK_ENV'] == 'production'
  map Skirace::Application.assets_prefix do
    run Skirace::Application.sprockets
  end
end

map '/' do
  run Skirace::Application
end
