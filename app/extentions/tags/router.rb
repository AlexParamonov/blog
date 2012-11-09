module Extentions
  module Tags
    class Router
      def initialize(controller, taggable_role, context)
        @controller, @taggable, @context = controller, taggable_role, context
      end

      def process
        case context_action
        when :create, :update
          taggable.find_and_assign_tags input_attributes
        end
      end

      def render
        view_action =
          case context_action
          when :show, :index then :preview_block
          when :new, :edit, :create, :update then :input
          else
            :nothing
          end

        tags =
          case context_action
          when :edit, :show, :index
            taggable.tags

          when :new
            []

          when :create, :update
            taggable.find_tags input_attributes

          end
        view_params = { tags: tags }

        controller.send view_action, view_params
      end

      private
      attr_reader :controller, :taggable, :context

      def context_action
        @context_action ||= context.action_name.to_sym
      end

      def input_attributes
        params = context.params

        case context_action
        when :create, :update
          params.fetch(:tags).split(/\s*,\s*/).map do |tag_name|
            { name: tag_name }
          end

        else
          []
        end
      end
    end
  end
end
