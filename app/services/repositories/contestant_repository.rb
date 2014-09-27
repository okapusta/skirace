class Repositories::ContestantRepository
  takes :db_contestant, :time_service, :time, :caching_service

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

  def first(options = {start_time_at: nil})
    current_contest = caching_service.get('current_contest')
    options.merge!({contest_id: current_contest}) if current_contest
    
    db_contestant.where(options).order(:id).first
  end

  def set_start_time
    first.update(start_time_at: Time.now)
  end

  def set_end_time(end_time_at)
    contestant  = first("start_time_at is not null and end_time is null")
    end_time = time_service.format(time.parse(end_time_at) - contestant.start_time_at)

    contestant.update(end_time_at: end_time_at, end_time: end_time)
    
    contestant
  end
end 