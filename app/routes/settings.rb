class Skirace::Application < Sinatra::Base
  get '/settings' do |settings_presenter|
    env['warden'].authenticate!
    settings_presenter.as_json
  end

  post '/settings' do |settings_service|
    env['warden'].authenticate!
    settings_service.set(params)
  end
end