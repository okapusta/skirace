class Presenters::PublicContestPresenter

  takes :contestant_presenter

  def as_json(contest)
    {
      id:   contest.id,
      name: contest.name,
      contestants: contestant_presenter.as_hash(contest.contestants)
    }.to_json
  end
end