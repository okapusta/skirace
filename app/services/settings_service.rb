class SettingsService 
  takes :db_settings, :contest_repository

  def get
    db_settings.last || create_settings
  end

  def set(params)
    db_settings.last.update(params)
    if params['public_contest'] == 'on' 
      contest_repository.set_public(params['public_contest_id']) 
    else
     contest_repository.disable_public 
   end
  end

  private

    def create_settings
      db_settings.create
    end
end