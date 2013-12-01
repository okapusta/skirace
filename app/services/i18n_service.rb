class I18nService

  class TranslationNotFoundError < StandardError; end
  
  takes :configuration_service

  def translate
    configuration_service.get[:skirace][:application][:locale][default_locale]
  rescue
    raise TranslationNotFoundError, 'translation not found'
  end

  def error_messages
    [:error_messages]
  end
  
  private

    def default_locale
      configuration_service.get[:skirace][:application][:locale][:default_locale]
    end
end