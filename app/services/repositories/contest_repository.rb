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

  def get_public
    db_contest.where(public: true).first
  end

  def set_public(id)
    disable_public

    new_public_contest = get(id)
    new_public_contest.public = true

    save(new_public_contest) 
  end

  def disable_public
    db_contest.update_all({public: true}, {public: false})
  end

  private

    def create_default
      [ OpenStruct.new(db_contest.create(name: 'Default').values) ]
    end
end