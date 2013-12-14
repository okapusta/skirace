class I18nService

  class TranslationNotFoundError < StandardError; end
  class DefaultLocaleNotSetError < StandardError; end
  
  takes :configuration_service

  def translate
    configuration_service.get_locale[default_locale]
  rescue
    raise TranslationNotFoundError, 'translation not found' # TODO: translate exceptions
  end
  
  private

    def default_locale
      configuration_service.get_locale[:default_locale]
    rescue
      raise DefaultLocaleNotSetError, 'default locale is not set'
    end
end