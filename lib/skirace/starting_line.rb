module Skirace
  class StartingLine
    def initialize(path)
      Thread.new(Injector.new) do |i|
        while true
          begin 
            reading = 0
            i.capacitor.discharge(i.options.capacitor.pin)

            while i.gpio.read(i.options.capacitor.pin) == LOW
              reading +=1
            end

            if reading > i.options.activation_threshold
              i.contestant_repository.set_start_time
            end

            sleep i.options.measurement_accuracy
          rescue => e
            puts e.message 
            puts e.backtrace.join("\n")
          end
        end
      end
    end
  end
end
