get '/contests' do |contest_presenter, contest_repository|
  contest_presenter.as_json(contest_repository.all)
end
