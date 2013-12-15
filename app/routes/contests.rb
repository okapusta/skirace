class Skirace::Application < Sinatra::Base
  get '/contests' do |contest_presenter, contest_repository|
    contest_presenter.as_json(contest_repository.all)
  end

  get '/contests/public/contestants' do |public_contest_presenter, contest_repository|
    begin 
      public_contest_presenter.as_json(contest_repository.get_public)
    rescue
      {response: 'no-public-contests', status: 404}.to_json
    end
  end

  get '/contests/:id/contestants' do |contestant_presenter, contest_repository|      
    env['warden'].authenticate!

    contestants = contest_repository.get(params[:id]).contestants
    contestant_presenter.as_json(contestants)
  end

  post '/contests' do |json_parser, contest_repository|
    env['warden'].authenticate!

    content_type :json
    params = json_parser.parse(request.body.read)
    contest = contest_repository.build(params)
    if contest_repository.save(contest)
      status 200
    else
      status 422
    end
  end
end