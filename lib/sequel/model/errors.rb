module Sequel
  class Model
    class Errors < ::Hash
      
      def full_messages
        
      end
      
      private

        def injector
          @injector ||= Injector.new(OpenStruct.new(params: nil))
        end
    end
  end
end