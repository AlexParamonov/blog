require_relative 'model_errors'

module Extentions
  module Validation
    class Adapter
      attr_reader :object

      def initialize(object)
        @object = object
      end

      def errors
        model.new(
          model_name: model_name,
          messages: messages
        )
      end

      private
      def model_name
        raise NotImplementedError
      end

      def messages
        raise NotImplementedError
      end

      def model
        ModelErrors
      end
    end
  end
end
