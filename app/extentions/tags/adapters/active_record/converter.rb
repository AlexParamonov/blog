module Extentions
  module Tags
    module Adapter
      module ActiveRecord
        class Converter
          def from_data_objects(data_objects)
            data_objects.map do |data_object|
              new_tag data_object
            end
          end

          def to_data_objects(tags)
            tags.map do |tag|
              new_data_object tag
            end
          end

          private
          attr_reader :tag_source, :data_source

          def new_tag(data_object)
            Model::Tag.new(data_object.attributes)
          end

          def new_data_object(tag)
            Data::Tag.find_or_create({ name: tag.name })
          end
        end
      end
    end
  end
end
