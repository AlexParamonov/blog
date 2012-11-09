module Extentions
  module Tags
    class TagsStorageDb < ActiveRecord::Base
      self.table_name = :tags

      # include ::FigLeaf
      # hide ActiveRecord::Base, ancestors: true, except: [Object, :[], :destroyed?, :marked_for_destruction?, :valid?, :new_record?, :save, :save!, :record_timestamps, :id, :id=, :init_with, :changed_for_autosave?]
      # hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods, ActiveRecord::Relation

      attr_accessible :name
      has_many :tags_relations, dependent: :destroy, class_name: 'TagsRelationDb', foreign_key: 'tag_id'

      def self.find_or_create(attributes)
        # create!(attributes)
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
    end
  end
end
