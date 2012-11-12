module Extentions
  module Tags
    class Router
      def initialize(controller, taggable_role, context)
        @controller, @taggable, @context = controller, taggable_role, context
      end

      def process
        case context_action
        when :create, :update
          taggable.tags = input_tags
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
            taggable.find_or_create input_tags

          end
        view_params = { tags: tags }

        controller.send view_action, view_params
      end

      private
      attr_reader :controller, :taggable, :context

      def context_action
        @context_action ||= context.action_name.to_sym
      end

      def input_tags
        params = context.params

        tags =
          case context_action
          when :create, :update
            Extractor.new.from_string(params.fetch(:tags))

          else
            []
          end

        TagList.new tags
      end
    end
  end
end
