module Extentions
  module Tags
    class Presenter
      def initialize(model, template)
        @tags = model.tags
        @template = template
      end

      def inline
        tags.join(', ')
      end

      def preview_block
        if tags.any? then template.render('/preview_block', locals: { inline_tags: inline }) else nothing end
      end

      def input
        if tags.any? then template.render('/input', locals: { inline_tags: inline }) else nothing end
      end

      def nothing
        ""
      end

      private
      attr_reader :tags, :template
    end
  end
end
