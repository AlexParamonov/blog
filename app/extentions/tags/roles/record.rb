module Extentions
  module Tags
    module Role
      class Record
        def initialize(model, params = {})
          @model = model
          @mapper = params.fetch(:mapper)
          @data_source = params.fetch(:data_source)
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
