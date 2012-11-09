require_relative '../null/extention'
require_relative '../renderer' if defined? Rails
require 'naming'

module Extentions
  module Base
    class Extention
      def self.apply(*params)
        extention = new(*params)
        extention.valid? ? extention : Null::Extention.new
      end

      # TODO seems like router should not be responcible for rendering
      def render
        router.render
      end

      def process
        router.process
      end


      def to_token
        Naming.new(self).tokens.last
      end

      def valid?(*)
        raise NotImplementedError
      end

      private_class_method :new
      private
      attr_reader :model, :context

      def initialize(model, context)
        @model   = model
        @context = context
      end

      def view
        Extentions::Renderer.new(self)
      end

      def role
        module_class("Role").new(model)
      end

      def controller
        module_class("Controller").new(model, view)
      end

      def router
        module_class("Router").new(controller, role, context)
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
