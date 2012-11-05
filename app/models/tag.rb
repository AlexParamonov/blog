module Extentions
  module Tags
    class Tag
      attr_reader :name

      def initialize(attrs = {})
        @name = attrs.fetch :name
      end

      def to_s
        name
      end
    end
  end
end
