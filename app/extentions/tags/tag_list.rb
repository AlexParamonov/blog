module Extentions
  module Tags
    class TagList
      extend Forwardable
      attr_reader :tags

      def_delegators :tags, :empty?, :to_a, :each, :size

      def initialize(tags)
        @tags = tags
        @tags.each &:downcase!
        @tags.uniq!
      end

      def sort(*args, &block)
        self.class.new tags.sort(*args, &block)
      end
    end
  end
end
