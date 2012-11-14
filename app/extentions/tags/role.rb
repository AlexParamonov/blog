require_relative 'roles/record'
require_relative 'roles/relation'

module Extentions
  module Tags
    module Role
      def self.for(model)
        case model
        when ::Class, ::ActiveRecord::Relation
          Relation.new(model)
        else
          Record.new(model)
        end
      end
    end
  end
end
