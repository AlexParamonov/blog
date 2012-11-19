require 'extentions/base/factory'
require_relative 'roles/record'
require_relative 'roles/relation'

module Extentions
  module Tags
    # TODO change name
    class Factory < Base::Factory
      def role_for(model)
        case model.class.to_s
        when 'Class', 'ActiveRecord::Relation'
          adapter.relation.call(model)
        else
          adapter.record.call(model)
        end
      end
    end
  end
end
