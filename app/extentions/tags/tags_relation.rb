module Extentions
  module Tags
    class TagsRelation
      def initialize(model)
        @model = model
      end

      def tags
        db = TagsRelationDb.table_name.to_sym
        TagsStorageDb.joins(db).where(db => { model_type: model_type, model_id: model_id })
      end

      def tags=(tags)
        TagsRelationDb.where(model_type: model_type, model_id: model_id).delete_all
        tags.each do |tag|
          TagsRelationDb.create!(model: model, tag: tag)
        end
      end

      private
      attr_reader :model
      def model_type
        model.class.name
      end

      def model_id
        model.id
      end
    end

    class TagsRelationDb < ActiveRecord::Base
      self.table_name = :tags_relations
      # include ::FigLeaf
      # hide ActiveRecord::Base, ancestors: true, except: [Object, :[]=, :[], :save!, :record_timestamps, :id, :id=, :init_with, :association]
      # hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods, ActiveRecord::Relation

      attr_accessible :model, :tag
      belongs_to :tag, autosave: true, class_name: 'TagsStorageDb'
      belongs_to :model, polymorphic: true
    end
  end
end
