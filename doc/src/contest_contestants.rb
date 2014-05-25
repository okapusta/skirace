get '/contests/:id/contestants' do |contestant_presenter, contest_repository|      
  env['warden'].authenticate!

  contestants = contest_repository.get(params[:id]).contestants
  contestant_presenter.as_json(contestants)
end