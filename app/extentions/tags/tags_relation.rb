module Extentions
  module Tags
    class TagsRelation < ActiveRecord::Base
      # include ::FigLeaf
      # hide ActiveRecord::Base, ancestors: true, except: [Object, :[]=, :[], :save!, :record_timestamps, :id, :id=, :init_with, :association]
      # hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods, ActiveRecord::Relation

      attr_accessible :model, :tag
      belongs_to :tag, autosave: true, class_name: 'TagsStorage'
      belongs_to :model, polymorphic: true

      def self.load_tags_for(model)
        where(model_type: model.class.name, model_id: model.id).includes(:tag).map do |relation|
          relation.tag
        end
      end

      def self.assign(model, tags)
        tags.each do |tag|
          create!(model: model, tag: tag)
        end
      end
    end
  end
end
