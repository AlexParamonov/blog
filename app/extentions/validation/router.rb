module Extentions
  module Validation
    # TODO add interface
    class Router
      def initialize(controller, role, context)
        @controller, @role, @context = controller, role, context
      end

      def process
      end

      def render
        view_action = :form
        view_params = { messages: role.messages, model_name: role.model_name }

        controller.send view_action, view_params
      end

      private
      attr_reader :controller, :role, :context
    end
  end
end
