module Skirace
  class Hash < ::Hash

    def deep_merge!(hash)
      target = self
      
      hash.keys.each do |key|
        if hash[key].is_a?(::Hash) and target[key].is_a?(::Hash)
          target[key] = target.class[target[key]].deep_merge!(hash[key])
          next
        end
        target.update(hash) { |key, *values| values.flatten.uniq } 
      end
      target
    end

    def with_indifferent_access(hash) 
      return unless hash.respond_to?(:each_value)

      hash.default_proc = proc { |h, k| h.key?(k) ? h[k] : h[k.to_s] }
      hash.each_value do |hash|
        with_indifferent_access(hash)
      end
    end

    def search(hash = nil, key)
      hash = hash || self 
      
      hash.each_pair do |_key, value|
        binding.pry
        next if hash[key]
        
        if value.is_a?(::Hash)
          hash.class[value].search(value, key)
        end 
      end
      hash[key]
    end

    def symbolize_keys!(hash)
      hash.inject({}) do |h, (k, v)|
        h[k.to_sym] = v
        h
      end
    end

    alias_method :to_options, :symbolize_keys!

  end 
end
