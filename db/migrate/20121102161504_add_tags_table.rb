class AddTagsTable < ActiveRecord::Migration
  def change
    # create_table :tags do |t|
    #   t.string :model_type
    #   t.integer :model_id
    #   t.array :tags
    # end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :tag_relations do |t|
      t.belongs_to :model, polymorphic: true
      t.belongs_to :tag
    end

    add_index :tag_relations, [:model_id, :model_type]
    add_index :tags, :name, uniq: true
    add_index :tag_relations, [:model_id, :model_type, :tag_id], uniq: true
  end
end
