class Uploaders::ImportUploader
  takes :xml_parser, :json_parser, :csv_parser, :contestant_repository
  
  attr_reader :filename, :tempfile

  def upload(file)
    @filename = file[:filename]
    @tempfile = file[:tempfile]
    
    self  
  end

  def process(current_contest)
    contestants = case format
      when 'json'
        json_parser.parse(tempfile.read)
      when 'xml'
        xml_parser(tempfile.read) 
      when 'csv'
        csv_parser.parse(tempfile.read)
      else
        return false
      end
    
    contestants.each do |contestant|
      success = contestant_repository.save(
        contestant_repository.build(params(contestant, current_contest))
      )
      return false unless success
    end
  end

  private

    def format
      filename.split('.').last
    end

    def params(contestant, current_contest)
      {
        contestant: {
          first_name: contestant['first_name'], 
          last_name: contestant['last_name'],
        },
        contest: {
            id: current_contest
          }  
      }
    end
end