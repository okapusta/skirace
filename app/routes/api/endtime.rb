class Skirace::Application < Sinatra::Base
  post '/api/endtime' do |contestant_repository|
    contestant = contestant_repository.set_end_time(params[:end_time])

    { 
      total_time: contestant.end_time, 
      first_name: contestant.first_name,
      last_name: contestant.last_name 
    }.to_json
  end
end