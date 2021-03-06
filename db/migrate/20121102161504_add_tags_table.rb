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

    create_table :tags_relations do |t|
      t.belongs_to :model, polymorphic: true
      t.belongs_to :tag
    end

    add_index :tags_relations, [:model_id, :model_type]
    add_index :tags, :name, unique: true
    add_index :tags_relations, [:model_id, :model_type, :tag_id], unique: true
  end
end
