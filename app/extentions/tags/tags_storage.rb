module Extentions
  module Tags
    class TagsStorage < ActiveRecord::Base
      self.table_name = :tags

      # include ::FigLeaf
      # hide ActiveRecord::Base, ancestors: true, except: [Object, :[], :destroyed?, :marked_for_destruction?, :valid?, :new_record?, :save, :save!, :record_timestamps, :id, :id=, :init_with, :changed_for_autosave?]
      # hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods, ActiveRecord::Relation

      attr_accessible :name
      has_many :tag_relations, dependent: :destroy

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
    end
  end
end
