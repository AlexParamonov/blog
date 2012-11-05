require_relative "../adapter"

module Extentions
  module Validation
    class ActiveModelAdapter < Adapter
      def model_name
        object.class.model_name.human
      end

      def messages
        object.errors.full_messages
      end
    end
  end
end
