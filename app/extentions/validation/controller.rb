module Extentions
  module Validation
    class Controller
      def initialize(model, template)
        @model, @template = model, template
      end

      def form(params)
        messages = params.fetch :messages
        model_name = params.fetch :model_name
        if messages.any? then template.render('/form', locals: { messages: messages, model_name: model_name }) else nothing end
      end

      def nothing
        ""
      end

      private
      attr_reader :template
    end
  end
end
