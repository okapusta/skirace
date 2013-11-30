class I18nService

  takes :configuration_service

  def translate word, file, locale = default_locale
    
  end
  
  private

    def default_locale
      configuration_service.get['skirace']['application']['default_locale']
    end
end