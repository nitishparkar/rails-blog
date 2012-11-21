class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :commenter
      t.text :body
      t.references :blog_post

      t.timestamps
    end
    add_index :user_comments, :blog_post_id
  end
end
