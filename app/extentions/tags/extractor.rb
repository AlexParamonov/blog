require_relative "tag"
require_relative 'tags_storage' if defined? Rails

module Extentions
  module Tags
    class Extractor
      def initialize(params = {})
        @tag_source  = params.fetch(:tag_source,  -> attrs { Tag.new(attrs) })
        @data_source = params.fetch(:data_source, -> attrs { TagsStorageDb.new(attrs) })
      end

      def from_string(string_input)
        string_input.split(/\s*,\s*/).map do |tag_name|
          new_tag name: tag_name
        end
      end

      def from_data_objects(data_objects)
        data_objects.map do |data_object|
          new_tag data_object.attributes
        end
      end

      def to_data_objects(tags)
        tags.map do |tag|
          new_data_object({ name: tag.name })
        end
      end

      private
      attr_reader :tag_source, :data_source

      def new_tag(*args)
        tag_source.call(*args)
      end

      def new_data_object(*args)
        data_source.call(*args)
      end
    end
  end
end
