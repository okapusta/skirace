class Parsers::XmlParser
  takes :xml

  def parse(params)
    parsed_xml  = xml.parse(params)
    contestants = []
    
    parsed_xml.xpath('//contestants').first.children.each do |child|
      if child.name == 'contestant'
        hash = {}
        child.children.each do |c|
          next if c.kind_of?(Nokogiri::XML::Text)
          hash[c.name] = c.children.first.text if c.children.first
        end
        contestants << hash
      end
    end
    contestants
  end
end