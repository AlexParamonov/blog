require_relative 'data/tag'
require_relative 'data/relation'

module Extentions
  module Tags
    module Adapter
      module ActiveRecord
        class Storage
          def initialize(model)
            @model = model
          end

          def store(tags)
            store_tags(tags)
          end

          def load
            tags
          end

          private
          attr_reader :model

          def tags
            @tags ||= fetch_tags
          end

          def fetch_tags
            db = Data::Relation.table_name.to_sym
            Data::Tag.joins(db).where(db => { model_type: model_type, model_id: model_id })
          end

          def store_tags(tags)
            Data::Relation.where(model_type: model_type, model_id: model_id).delete_all
            tags.map do |tag|
              Data::Relation.create!(model: model, tag: tag)
            end
            @tags = tags
          end

          def model_type
            model.class.name
          end

          def model_id
            model.id
          end
        end
      end
    end
  end
end
