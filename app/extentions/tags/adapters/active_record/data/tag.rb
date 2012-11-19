require_relative 'relation'

module Extentions
  module Tags
    module Data
      class Tag < ActiveRecord::Base
        self.table_name = :tags

        attr_accessible :name
        has_many :tags_relations, dependent: :destroy, class_name: 'Data::Relation', foreign_key: 'tag_id'

        def self.find_or_create(attributes)
          relation = where(attributes)
          if relation.none?
            create!(attributes)
          else
            relation.first
          end
        end

        def attributes
          super
        end
      end
    end
  end
end
