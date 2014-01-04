class SettingsService 
  takes :db_settings, :contest_repository

  def get
    db_settings.last || create_settings
  end

  def set(params)
    if params['public_contest'] == 'on' 
      contest_repository.set_public(params['public_contest_id']) 
    else
      params.merge!(public_contest: false)
      contest_repository.disable_public 
    end

    params.merge!(multi_contest: false) if params['multi_contest'].nil?   
    db_settings.last.update(params)
  end

  private

    def create_settings
      db_settings.create
    end
end