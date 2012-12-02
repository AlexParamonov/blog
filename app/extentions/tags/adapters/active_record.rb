require_relative '../lib/mapper'
require_relative '../models/tag'
require_relative 'active_record/data/tag'
require_relative 'active_record/storage'
require_relative '../roles/record'
require_relative '../roles/relation'

module Extentions
  module Tags
    module Adapter
      module ActiveRecord
        def self.record
          adapters = {
            mapper: Mapper.new(tag_source:  -> data { Model::Tag.new(data.attributes) },
                               data_source: -> tag  { Data::Tag.find_or_create({ name: tag.name }) }),

            data_source: Storage.public_method(:new)
          }

          -> model { Role::Record.new(model, adapters) }
        end

        def self.relation
          Role::Relation.public_method(:new)
        end
      end
    end
  end
end
