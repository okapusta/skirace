require './application'

# Skirace::StartingLine.new(ENV['PWD'] || ENV['BUNDLE_GEMFILE'].gsub('Gemfile',''))

t = Thread.new(Injector.new) do |i|
  file = File.open(File.join(path, 'log','reading.log'), "a")

  while true
    begin
      reading = 0
      i.capacitor.discharge(i.options.capacitor.pin)

      while i.gpio.read(i.options.capacitor.pin) == LOW
        reading +=1
      end
      file.write("#{reading}\n")
      if reading > i.options.activation_threshold
        i.contestant_repository.set_start_time
      end

      sleep i.options.measurement_accuracy
    rescue => e
      file.write("exception occured: #{e.message} \n")
      file.write(e.backtrace.join("\n"))
    end
  end
end

t.abort_on_exception = true

unless ENV['RACK_ENV'] == 'production'
  map Skirace::Application.assets_prefix do
    run Skirace::Application.sprockets
  end
end

map '/' do
  run Skirace::Application
end
