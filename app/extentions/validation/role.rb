require_relative 'adapters/active_model_adapter'

module Extentions
  module Validation
    class Role
      def self.for(model)
        if model.respond_to?(:errors) && model.errors.is_a?(ActiveModel::Errors)
          ActiveModelAdapter.new(model)
        else
          raise RuntimeError, "Adapter for #{model} is missing"
        end
      end
    end
  end
end
