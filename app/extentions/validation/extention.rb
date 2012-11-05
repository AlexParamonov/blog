require 'extentions/base/extention'
require_relative 'presenter'
require_relative 'role'
# require_relative 'extractor'

module Extentions
  module Validation
    class Extention < Base::Extention
      def valid?
        applicable_actions.include? context.action_name.to_s
      end

      private
      def present_as
        case context.action_name.to_sym
          when :create, :update, :edit, :new then :form
          else :nothing
        end
      end

      def process
      end

      def applicable_actions
        %w(edit update new)
      end
    end
  end
end

