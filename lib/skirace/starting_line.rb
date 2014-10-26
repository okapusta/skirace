module Skirace
  class StartingLine
    def initialize(path)
      Thread.new(Injector.new) do |i|
        while true
          reading = 0
          i.capacitor.discharge(i.options.capacitor.pin)

          while i.gpio.read(i.options.capacitor.pin) == LOW
            reading +=1
          end
          p reading
          if reading > i.options.activation_threshold
            i.contestant_repository.set_start_time
          end

          sleep i.options.measurement_accuracy
        end
      end
    end
  end
end
