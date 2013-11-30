module Configuration
  class ConfigurationHash < Hash
    
    def initailize(hash) 
      super(hash)
    end

    # https://www.ruby-forum.com/topic/142809

    def deep_merge!(hash)
      hash.keys.each do |key|
        if self[key].is_a?(Hash) && hash[key].is_a?(Hash)
          self.class[self[key]].deep_merge!(hash[key])
        else
          self[key] = hash[key]
        end
      end
    end
  end
end

# i = Injector.new(OpenStruct.new(params: nil))
# i.configuration_service.get

# self[key] = self[key] ? self.class[self[key]].deep_merge!(hash[key]) : hash[key]

