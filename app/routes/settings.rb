class Skirace::Application < Sinatra::Base
  get '/settings' do |settings_service, settings_presenter|
    settings_presenter.as_json(settings_service.get)
  end

  post '/settings' do |settings_service|
    settings_service.set(params)
  end
end