module Extentions
  module Tags
    class Controller
      def initialize(model, template)
        @model, @template = model, template
      end

      def inline(params)
        tags = params.fetch :tags
        tags.join(', ')
      end

      def preview_block(params)
        tags = params.fetch :tags
        if tags.any? then template.render('/preview_block', locals: { inline_tags: inline(params) }) else nothing end
      end

      def input(params)
        tags = params.fetch :tags
        template.render('/input', locals: { inline_tags: inline(params) })
      end

      def nothing(*)
        ""
      end

      private
      attr_reader :model, :template
    end
  end
end
