class Repositories::ContestRepository
  takes :db_contest

  def build(params)
    db_contest.new(params)
  end

  def all
    db_contest.all || create_default
  end

  def get(id)

  end

  def save(contest)
    contest.save
  end

  private

    def create_default
      db_contest.create(name: 'default')
    end
end