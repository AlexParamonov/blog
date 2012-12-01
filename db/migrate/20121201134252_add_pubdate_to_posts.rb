class AddPubdateToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :pubdate, :datetime, null: false, default: 'NOW()'
  end
end
