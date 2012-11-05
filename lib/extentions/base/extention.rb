require_relative '../null/extention'
require 'naming'

module Extentions
  module Base
    class Extention
      def self.apply(*params)
        extention = new(*params)
        extention.valid? ? extention : Null::Extention.new
      end

      def render
        presenter.send present_as
      end

      def process
        extractor.send process_action
      end

      def to_token
        Naming.new(self).module_name.split('::').last.downcase.to_sym
      end

      def valid?(*)
        raise NotImplementedError
      end

      private_class_method :new
      private
      attr_reader :model, :context

      def render_action(*)
        raise NotImplementedError
      end

      def process_action(*)
        raise NotImplementedError
      end

      def initialize(model, context)
        # @model   = params.fetch :model
        # @context = params.fetch :context, nil
        @model   = model
        @context = context
      end

      def presenter
        # TODO require render normal way is increadible hard to test
        require_relative '../renderer'
        module_class("Presenter").new(module_class("Role").new(model), Extentions::Renderer.new(self))
      end

      def extractor
        module_class("Extractor").new(module_class("Role").new(model), context)
      end

      def module_class(name)
        "#{Naming.new(self).module_name}::#{name}".constantize
      end

      def model_is_any_of?(*classes)
        # Note that '&' is the set intersection operator for Arrays.
        (classes.map(&:to_s) & model.class.ancestors.map(&:name)).any?
      end
    end
  end
end
