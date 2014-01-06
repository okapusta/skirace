class Uploaders::ImportUploader
  takes :xml_parser, :json_parser, :csv_parser, :contestant_repository
  
  attr_reader :filename, :tempfile

  def upload(file)
    @filename = file[:filename]
    @tempfile = file[:tempfile]
    
    self  
  end

  def process
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
      contestant_repository.build(contestant)
    end
  end

  private

    def format
      filename.split('.').last
    end
end