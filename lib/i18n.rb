class I18n
  
  define_singleton_method(:t){ :translate }

  class << self
    def translate word, locale = nil
      
    end

    private

      def injector
        injector ||= Injector.new
      end
  end
end