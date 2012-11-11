require_relative "tag"

module Extentions
  module Tags
    class Extractor
      def from_string(string_input)
        string_input.split(/\s*,\s*/).map do |tag_name|
          new_tag name: tag_name
        end
      end

      private
      def new_tag(attributes)
        Tag.new attributes
      end
    end
  end
end
