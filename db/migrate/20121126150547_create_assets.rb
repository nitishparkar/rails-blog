class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :blog_post

      t.timestamps
    end
    add_index :assets, :blog_post_id
  end
end
