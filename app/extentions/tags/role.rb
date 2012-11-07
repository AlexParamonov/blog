module Extentions
  module Tags
    class Role
      def initialize(model)
        @model = model
      end

      def find_and_assign_tags(attributes)
        tags = attributes.map do |attribute_set|
          TagsStorage.find_or_create(attribute_set)
        end

        TagsRelation.assign(model, tags)
      end

      def tags
        TagsRelation.load_tags_for(model).map do |tag_object|
          Tag.new tag_object.attributes.symbolize_keys
        end
      end

      private
      attr_reader :model
    end
  end
end
