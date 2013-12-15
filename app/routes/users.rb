class Skirace::Application < Sinatra::Base
  get '/users' do |user_presenter, user_repository|
    env['warden'].authenticate!

    user_presenter.as_json(user_repository.all)
  end
  
  post '/users' do |json_parser, user_repository, hash|
    env['warden'].authenticate!
    content_type :json

    params = json_parser.parse(request.body.read)
    user = user_repository.build(params)
    if user_repository.save(user)
      {success: true}.to_json
    else
      status 422
    end
  end
end