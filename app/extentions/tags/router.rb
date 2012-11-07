module Extentions
  module Tags
    class Router
      def initialize(controller, taggable_role, context)
        @controller, @taggable, @context = controller, taggable_role, context
      end

      def process
        action = context.action_name.to_sym
        input_params = context.params

        case action
        when :create, :update, :delete
          apply_changes(action, input_params)
        else
          render(action)
        end
      end

      private
      attr_reader :controller, :taggable, :context

      def apply_changes(action, input_params)
        attributes =
          case action
          when :create, :update
            input_params.fetch(:tags).split(/\s*,\s*/).map do |tag_name|
              { name: tag_name }
            end

          when :delete
            []
          end

        taggable.find_and_assign_tags attributes
      end

      def render(action)
        view_action =
          case action
          when :show, :index then :preview_block
          when :new, :edit then   :input
          else
            :nothing
          end

        view_params =
          case(action)
          when :edit, :show, :index
            { tags: taggable.tags }

          when :new
            { tags: [] }
          end

        controller.send view_action, view_params
      end
    end
  end
end
