require './application'

map Skirace::Application.assets_prefix do
  run Skirace::Application.sprockets
end

map '/' do
  run Skirace::Application
end