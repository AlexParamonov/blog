module Extentions
  module Tags
    class Tag
      extend Forwardable
      attr_reader :name

      def_delegators :to_s, :downcase!

      def initialize(attrs = {})
        @name = attrs.fetch(:name).to_s
      end

      # act as string

      def <=>(other)
        to_s <=> other.to_s
      end

      def hash
        to_s.hash
      end

      def ==(other)
         to_s == other.to_s
      end

      def to_s
        comparation_attribute(self)
      end

      # delegate to ==
      def eql?(other)
        self == other
      end

      private
      def comparation_attribute(object)
        name
      end
    end
  end
end

