module Extentions
  module Tags
    module Model
      class TagList
        extend Forwardable
        include Enumerable

        attr_reader :tags

        def_delegators :tags, :empty?, :to_a, :each, :size, :join
        def initialize(tags)
          @tags = tags
          @tags.each &:downcase!
          @tags.uniq!
        end

        def sort(*args, &block)
          self.class.new tags.sort(*args, &block)
        end

        def to_ary
          tags
        end
      end
    end
  end
end
