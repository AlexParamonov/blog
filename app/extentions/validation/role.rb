require_relative 'adapters/active_model_adapter'

module Extentions
  module Validation
    class Role
      def initialize(model)
        @model = model
      end

      def messages
        adapter.messages
      end

      def model_name
        adapter.model_name
      end

      private
      attr_reader :model
      def adapter
        if model.respond_to?(:errors) && model.errors.is_a?(ActiveModel::Errors)
          active_model
        else
          raise RuntimeError, "Adapter for #{model} is missing"
        end
      end

      def active_model
        ActiveModelAdapter.new(model)
      end
    end
  end
end
