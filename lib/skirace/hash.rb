module Skirace
  class Hash < ::Hash


    # https://www.ruby-forum.com/topic/142809
    # http://stackoverflow.com/questions/9381553/ruby-merge-nested-hash

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

    # http://stackoverflow.com/questions/10780817/ruby-hash-with-indifferent-access

    def with_indifferent_access(hash = nil) 
      return unless hash.respond_to?(:each_value)

      hash.default_proc = proc { |h, k| h.key?(k) ? h[k] : h[k.to_s] }
      hash.each_value do |hash|
        with_indifferent_access(hash)
      end
    end

  end
end
