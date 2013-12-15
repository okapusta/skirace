class Skirace::Application < Sinatra::Base
  get '/login' do
    haml :login
  end

  delete '/logout' do
    content_type :json

    env['warden'].logout
    {return_to: '/'}.to_json
  end

  post '/login' do |user_repository, json_parser|
    env['warden'].authenticate!
    content_type :json
    
    redirect '/forbidden' unless token = session['warden.user.default.key']

    {user: {authenticated: true, auth_token: token}}.to_json  
  end
end