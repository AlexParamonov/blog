require_relative 'taggable_record'
require_relative 'taggable_relation'

module Extentions
  module Tags
    class Role
      def self.for(model)
        case model
        when ::Class, ::ActiveRecord::Relation
          TaggableRelation.new(model)
        else
          TaggableRecord.new(model)
        end
      end
    end
  end
end
