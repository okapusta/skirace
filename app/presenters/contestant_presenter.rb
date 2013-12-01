class ContestantPresenter

  def as_json(collection)
    collection.map do |contestant| 
      {
        contest_id: contestant.contest_id,
        first_name: contestant.first_name,
        last_name: contestant.last_name,
        end_time: contestant.end_time
      }
    end.to_json
  end
end