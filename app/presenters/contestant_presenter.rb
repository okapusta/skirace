require 'csv'
require 'haml'

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

  def as_csv(collection)
    csv_string = ::CSV.generate do |csv|
      csv << ['contest_id', 'first_name', 'last_name', 'end_time']
      
      collection.each do |contestant|
        csv << [ contestant.contest_id,
          contestant.first_name,
          contestant.last_name,
          contestant.end_time
        ]
      end
    end
  end

  def as_xml(collection)
    template = File.read('app/views/presenters/xml_presenter.haml')
    Haml::Engine.new(template).render_proc(Object.new, :contestants).call contestants: collection
  end
end