# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121102161504) do

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tag_relations", :force => true do |t|
    t.integer "model_id"
    t.string  "model_type"
    t.integer "tag_id"
  end

  add_index "tag_relations", ["model_id", "model_type", "tag_id"], :name => "index_tag_relations_on_model_id_and_model_type_and_tag_id"
  add_index "tag_relations", ["model_id", "model_type"], :name => "index_tag_relations_on_model_id_and_model_type"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

end
