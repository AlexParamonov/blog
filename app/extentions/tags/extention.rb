require 'extentions/base/extention'
require_relative 'presenter'
require_relative 'role'
require_relative 'extractor'

module Extentions
  module Tags
    class Extention < Base::Extention
      def valid?
        applicable_actions.include?(context.action_name.to_s) \
          && model_is_any_of?('Post')
      end

      private
      def present_as
        case context.action_name.to_sym
          when :show, :index then :preview_block
          when :edit, :new then :input
          else :nothing
        end
      end

      def process_action
        return :extract_from_input
      end

      def applicable_actions
        %w(show new edit index)
      end
    end
  end
end

