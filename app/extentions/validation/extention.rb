require 'extentions/base/extention'
Dir[File.expand_path(File.dirname(__FILE__)) + "/*.rb"].each {|f| require f}

module Extentions
  module Validation
    class Extention < Base::Extention
      def valid?
        applicable_actions.include? context.action_name.to_s
      end

      private
      def applicable_actions
        %w(edit update new)
      end
    end
  end
end

