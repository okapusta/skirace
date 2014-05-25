class Skirace::Application < Sinatra::Base
  get '/contestants/:id' do |contestant_presenter, contestant_repository|
    env['warden'].authenticate!

    contestant_presenter.as_json(contestant_repository.get(params[:id]))
  end

  post '/contestants' do |hash, json_parser, contestant_repository|
    env['warden'].authenticate!
    content_type :json
    params = hash.with_indifferent_access(json_parser.parse(request.body.read))
    contestant = contestant_repository.build(params)
    if contestant_repository.save(contestant)
      status 200
    else
      status 422
    end
  end
end