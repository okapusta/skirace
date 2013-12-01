class Repositories::ContestRepository
  takes :db_contest

  def all
    db_contest.all || create_default
  end

  def get(id)

  end

  private

    def create_default
      db_contest.create(name: 'default')
    end
end