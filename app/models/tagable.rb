require_relative 'tag'

class Tagable
  def self.cache
    @cache ||= reset_cache
  end

  def self.reset_cache
    @cache = Hash.new { |h,k| h[k] = {} }
  end

  def initialize(model)
    @model = model
    @model_name = model.class.name
    @model_id = model.id
  end

  def tags=(tags)
    store_tags tags
    cache_tags tags
  end

  def tags
    cached_tags || begin
      cache_tags fetch_tags
    end
  end

  private
  attr_reader :model

  def cache_tags(tags)
    self.class.cache[@model_name][@model_id] = tags
  end

  def cached_tags
    # return self.class.cache.fetch(@model_name, {}).fetch(@model_id, [])
    self.class.cache.fetch(@model_name, {}).fetch(@model_id, false)
  end

  def store_tags(tags)
    TagRelations.assign(model, tags)
  end

  def fetch_tags
    TagRelations.fetch_tags(model)
  end

  private
  class TagRelations < ActiveRecord::Base
    include ::FigLeaf
    hide ActiveRecord::Base, ancestors: true, except: [Object, :[]=, :[], :save!, :record_timestamps, :id, :id=, :init_with]
    hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods, ActiveRecord::Relation

    attr_accessible :model, :tag
    belongs_to :tag, autosave: true, class_name: 'TagObject'
    belongs_to :model, polymorphic: true

    def self.fetch_tags(model)
      where(model_type: model.class.name, model_id: model.id).to_tags
    end

    def self.assign(model, tags)
      tags.each do |tag|
        tag = TagObject.new(name: tag.to_s)
        create!(model: model, tag: tag)
      end
    end

    def self.to_tags
      scoped.map do |relation|
        Tag.new relation.tag.attributes.symbolize_keys
      end
    end
  end

  class TagObject < ActiveRecord::Base
    self.table_name = :tags

    include ::FigLeaf
    hide ActiveRecord::Base, ancestors: true, except: [Object, :[], :destroyed?, :marked_for_destruction?, :valid?, :new_record?, :save, :record_timestamps, :id, :id=, :init_with]
    hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods, ActiveRecord::Relation

    attr_accessible :name
    has_many :tag_relations, dependent: :destroy

    def attributes
      super
    end

    def to_s
      name
    end
  end
end
