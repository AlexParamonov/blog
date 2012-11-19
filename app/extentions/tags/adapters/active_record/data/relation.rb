require_relative 'tag'

module Extentions
  module Tags
    module Data
      class Relation < ActiveRecord::Base
        self.table_name = :tags_relations

        attr_accessible :model, :tag
        belongs_to :tag, autosave: true, class_name: 'Data::Tag'
        belongs_to :model, polymorphic: true
      end
    end
  end
end
