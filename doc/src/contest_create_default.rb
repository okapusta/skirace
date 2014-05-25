class Repositories::ContestRepository
  takes :db_contest

  def all
    db_contest.any? ? db_contest.all : create_default
  end

  private

     def create_default
       [ OpenStruct.new(db_contest.create(name: 'Default').values) ]
     end
end
