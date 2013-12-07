class Repositories::ContestRepository
  takes :db_contest

  def build(params)
    db_contest.new(params)
  end

  def all
    db_contest.any? ? db_contest.all : create_default
  end

  def get(id)
    db_contest.find(id: id)
  end

  def save(contest)
    contest.save
  end

  private

    def create_default
      [ OpenStruct.new(db_contest.create(name: 'Default').values) ]
    end
end