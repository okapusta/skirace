module Skirace
  class StartingLine
    def initialize(env)
      Thread.new(Injector.new) do |i|
        file = File.open(File.join('log','reading.log'), "a")

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
    end
  end
end
