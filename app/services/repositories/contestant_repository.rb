class Repositories::ContestantRepository
  takes :db_contestant

  def build(params)
    contestant = db_contestant.new(params[:contestant])
    contestant.contest_id = params[:contest][:id]
    contestant
  end

  def save(contestant)
    contestant.save
  end

  def all
    db_contestant.all
  end

  def get(id)
    db_contestant.where(id: id).first
  end

  def last(options = {start_time_at: nil})
    db_contestant.where(options).last
  end

  def set_start_time
    last.update(start_time_at: Time.now)
  end
end 