require_relative 'model_errors'

module Extentions
  module Validation
    class Adapter
      attr_reader :object

      def initialize(object)
        @object = object
      end

      def messages
        raise NotImplementedError
      end

      def model_name
        raise NotImplementedError
      end
    end
  end
end
