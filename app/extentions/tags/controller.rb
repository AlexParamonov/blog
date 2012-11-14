module Extentions
  module Tags
    class Controller
      def initialize(model, template)
        @model, @template = model, template
      end

      def from_input(params)
        string_input = params.fetch :tags
        string_input.split(/\s*,\s*/)
      end

      # Render methods
      def preview_block(params)
        tags = params.fetch :tags
        if tags.any? then template.render('/preview_block', locals: { inline_tags: inline(tags) }) else nothing end
      end

      def input(params)
        tags = params.fetch :tags
        template.render('/input', locals: { input_value: to_input(tags) })
      end

      def nothing(*)
        ""
      end

      private
      attr_reader :model, :template
      def to_input(tags)
        tags.join(', ')
      end

      def inline(tags)
        to_input(tags)
      end
    end
  end
end
