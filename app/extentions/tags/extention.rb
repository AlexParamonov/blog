require 'extentions/base/extention'

module Extentions
  module Tags
    class Extention < Base::Extention
      def valid?
        model_is_any_of?('Post')
      end
    end
  end
end
