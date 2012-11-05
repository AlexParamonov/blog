module Extentions
  module Validation
    class Presenter
      def initialize(model, template)
        @errors = model.errors
        @template = template
      end

      def form
        if errors.any? then template.render('/form', locals: { errors: errors }) else nothing end
      end

      def nothing
        ""
      end

      private
      attr_reader :errors, :template
    end
  end
end
