module Sequel
  class Model
    module ClassMethods
      def update_all(where_options, hash)
        where(where_options).each do |record|
          record.update(hash)
        end
      end
    end
  end
end