module Extentions
  module Tags
    class TaggableRecord
      def initialize(record)
        @record = record
      end

      def tags=(tag_list)
        TagsRelation.new(record).tags = converter.to_data_objects(tag_list)
      end

      # TODO rename to_data_objects or wrap it. it looks confusing in current context
      def find_or_create(tag_list)
        converter.from_data_objects converter.to_data_objects(tag_list)
      end

      def tags
        converter.from_data_objects TagsRelation.new(record).tags
      end

      private
      attr_reader :record
      def converter
        Extractor.new
      end
    end
  end
end
