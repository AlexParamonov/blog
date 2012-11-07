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
        module_class("Router").new(controller, role, context).process
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

      def initialize(model, context)
        @model   = model
        @context = context
      end

      def view
        # TODO require render normal way is increadible hard to test
        require_relative '../renderer'
        Extentions::Renderer.new(self)
      end

      def role
        module_class("Role").new(model)
      end

      def controller
        module_class("Controller").new(model, view)
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
