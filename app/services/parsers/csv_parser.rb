class Parsers::CsvParser
  takes :csv

  def parse(params)
    contestants = []     
    csv.parse(params).each do |contestant|
      next if contestant.last

      contestants << {
        'first_name' => contestant[1],
        'last_name' => contestant[2]
      }
    end

    contestants
  end
end