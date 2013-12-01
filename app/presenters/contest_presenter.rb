class ContestPresenter

  def as_json(collection)
    collection.map do |contest| 
      {
        id:   contest.id,
        name: contest.name
      }
    end.to_json
  end
end