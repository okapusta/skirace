class ContestantPresenter

  def as_json(collection)
    collection.map do |contestant| 
      {
        first_name: contestant.first_name,
        last_name: contestant.last_name,
        end_time: contestant.end_time
      }
    end.to_json
  end
end