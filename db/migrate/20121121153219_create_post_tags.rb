class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.string :name
      t.references :blog_post

      t.timestamps
    end
    add_index :post_tags, :blog_post_id
  end
end
