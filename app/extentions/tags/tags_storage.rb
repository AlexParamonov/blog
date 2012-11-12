module Extentions
  module Tags
    class TagsStorageDb < ActiveRecord::Base
      self.table_name = :tags

      attr_accessible :name
      has_many :tags_relations, dependent: :destroy, class_name: 'TagsRelationDb', foreign_key: 'tag_id'

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

      def to_s
        name
      end

      # Should be in a model
      def <=>(other)
        name <=> other.name
      end
    end
  end
end