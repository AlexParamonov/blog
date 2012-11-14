require_relative '../mapper'
# TODO trust autoloader?
require_relative '../models/tag'
require_relative '../data/tags' if defined? Rails

module Extentions
  module Tags
    module Role
      # TODO TaggableRecord should be responsible for mapper and data source creation or this should be done in role?
      class Record
        def initialize(model, params = {})
          @model = model
          @data_source = params.fetch(:data_source, -> *attrs { Storage.new(*attrs) })
          @mapper  = params.fetch(:mapper) do
            Mapper.new(
              tag_source:  -> *attrs { Model::Tag.new(*attrs) },
              data_source: -> *attrs { Data::Tag.find_or_create(*attrs) }
            )
            # Mapper.new(
            #   tag_source:  Tag.public_method(:new),
            #   data_source: Data::Tags.public_method(:find_or_create)
            # )
          end
        end

        def tags=(tags)
          data_storage.store mapper.to_data_objects(tags)
        end

        def tags
          mapper.from_data_objects data_storage.load
        end

        private
        attr_reader :mapper, :model
        def data_storage
          @data_storage ||= @data_source.call(model)
        end
      end
    end
  end
end
