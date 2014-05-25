get '/contests/public' do |public_contest_presenter, contest_repository|
  begin 
    public_contest_presenter.as_json(contest_repository.get_public)
  rescue
    {response: 'no-public-contests', status: 404}.to_json
  end
end