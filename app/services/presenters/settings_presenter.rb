class Presenters::SettingsPresenter
  
  takes :settings_service
  
  def as_json
    settings_service.get.values.to_json
  end
end