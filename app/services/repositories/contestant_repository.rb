class Repositories::ContestantRepository
  takes :db_contestant

  def build(params)
    db_contestant.new(params)
  end

  def save(contestant)
    contestant.save
  end
end 