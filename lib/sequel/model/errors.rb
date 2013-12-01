module Sequel
  class Model
    class Errors < ::Hash
      
      def full_messages
        inject([]) do |m ,kv|
          att, errors = *kv
          errors.each do |e|
            m << (e.is_a?(LiteralString) ? e : "#{Array(error_messages[:attributes][att]).join(ATTRIBUTE_JOINER)}")
          end
          m
        end
      end
      
      private

        def injector
          @injector ||= Injector.new(OpenStruct.new(params: nil))
        end

        def error_messages
          injector.i18n_service.translate[:error_messages]
        end
    end
  end
end