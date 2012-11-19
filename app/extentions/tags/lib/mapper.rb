module Extentions
  module Tags
    class Mapper
      def initialize(params = {})
        @tag_source  = params.fetch(:tag_source)
        @data_source = params.fetch(:data_source)
      end

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

      def new_tag(*args)
        tag_source.call(*args)
      end

      def new_data_object(*args)
        data_source.call(*args)
      end
    end
  end
end
