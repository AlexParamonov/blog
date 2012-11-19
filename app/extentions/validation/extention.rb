require 'extentions/base/extention'

module Extentions
  module Validation
    class Extention < Base::Extention
      def valid?
        applicable_actions.include? context.action_name.to_s
      end

      private
      def applicable_actions
        %w(edit update new create update)
      end
    end
  end
end

