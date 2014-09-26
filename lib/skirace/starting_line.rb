module Skirace
  module StartingLine
    def self.registered(app)
      Thread.new(Injector.new) do |i|
        while true
          reading = 0
          i.capacitor.discharge(i.options.capacitor.pin)

          while i.gpio.read(i.options.capacitor.pin) == LOW
            reading +=1
          end

          if reading > i.options.activation_threshold
            i.contastant_repository.set_start_time
          end

          sleep i.options.measurement_accuracy
        end
      end
    end
  end
end
