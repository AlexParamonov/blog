module Extentions
  module Tags
    class Role
      def initialize(model)
        @model = model
      end

      def find_and_assign_tags(attributes_set)
        tags = find_tags attributes_set
        TagsRelation.new(model).tags = tags
      end

      def find_tags(attributes_set)
        attributes_set.map do |attributes|
          TagsStorageDb.find_or_create attributes
        end
      end

      def tags
        TagsRelation.new(model).tags.map do |tag_object|
          Tag.new tag_object.attributes.symbolize_keys
        end
      end

      private
      attr_reader :model
    end
  end
end
