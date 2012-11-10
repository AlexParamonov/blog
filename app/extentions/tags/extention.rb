require 'extentions/base/extention'
Dir[File.expand_path(File.dirname(__FILE__)) + "/*.rb"].each {|f| require f}

module Extentions
  module Tags
    class Extention < Base::Extention
      def valid?
        model_is_any_of?('Post')
      end
    end
  end
end
