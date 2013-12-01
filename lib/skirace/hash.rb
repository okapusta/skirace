module Skirace
  class Hash < ::Hash


    # https://www.ruby-forum.com/topic/142809
    # http://stackoverflow.com/questions/9381553/ruby-merge-nested-hash

    def deep_merge!(hash)
      hash.keys.each do |key|
        if hash[key].is_a?(Hash) # self[key].is_a?(Hash) && 
          self.class[self[key]].deep_merge!(hash[key])
        else
          self[key] = hash[key]
        end
      end
    end

    # http://stackoverflow.com/questions/10780817/ruby-hash-with-indifferent-access

    def with_indifferent_access(hash = nil)
      #each_pair do |key, obj|
      #  binding.pry
      #  if !key.nil? && obj.respond_to?(:each_pair)
      #    self.default_proc = proc { |h, k| h.key?(k) ? h[k] : h[k.to_s] }
      #    self.class[obj].with_indifferent_access
      #  end
      #end
      return unless hash.respond_to?(:each_pair)

      hash.default_proc = proc { |h, k| h.key?(k) ? h[k] : h[k.to_s] }
      hash.each_value do |hash|
        with_indifferent_access(hash)
      end
    end

  end
end

# i = Injector.new(OpenStruct.new(params: nil))
# i.configuration_service.get

# self[key] = self[key] ? self.class[self[key]].deep_merge!(hash[key]) : hash[key]

