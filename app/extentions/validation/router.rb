module Extentions
  module Validation
    class Router
      def initialize(controller, role, context)
        @controller, @role, @context = controller, role, context
      end

      def process
        action = context.action_name.to_sym
        render(action)
      end

      private
      attr_reader :controller, :role, :context

      def render(action)
        view_action = :form
        view_params = { messages: role.messages, model_name: role.model_name }

        controller.send view_action, view_params
      end
    end
  end
end
