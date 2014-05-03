require 'ostruct'
require './application'
require './app/services/injector'

Thread.new(Injector.new(OpenStruct.new({}))) do |injector|
  while true
    injector.capacitor.discharge(injector.options.capacitor.pin)      
    sleep 0.01; reading = 0;

    while injector.gpio.read(injector.options.capacitor.pin) == LOW
      reading += 1
    end

    if reading < injector.options.activation_threshold
      injector.caching_service.set('start_time', Time.now)
    end
  end
end

map Skirace::Application.assets_prefix do
  run Skirace::Application.sprockets
end

map '/' do
  Skirace::Application.set :environment, ENV['RAKE_ENV']
  run Skirace::Application
end
