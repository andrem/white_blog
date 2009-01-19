class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
	  t.string  :title
	  t.text    :text
      t.timestamps
    end
    add_index(:posts, :user_id)
  end
  
  def self.down
    drop_table :posts
  end
end
