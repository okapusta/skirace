class Repositories::ContestantRepository
  takes :db_contestant, :db_contest, :time_service, :time, :caching_service

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
    options.merge!({contest_id: current_contest}) if current_contest
    
    db_contestant.where(options).order(:id).first
  end

  def set_start_time
    contestant = first || create_default

    contestant.update(start_time_at: Time.now)
  end

  def set_end_time(end_time_at)
    contestant  = first("start_time_at is not null and end_time is null")

    end_time = time_service.format(
      time.parse(end_time_at) - contestant.start_time_at
      )

    contestant.update(end_time_at: end_time_at, end_time: end_time)
    
    contestant
  end

  private

  def current_contest
    caching_service.get('current_contest')
  end

  def create_default
    unless time.now - db_contestant.last.start_time_at > 5
      db_contestant.create
    end
  # rescure from undefined method start_time_at for nil class
  rescue
    db_contestant.create
  end
end 