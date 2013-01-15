class RemoveIndexFromBlogPosts < ActiveRecord::Migration
  def change
  	remove_index(:blog_posts, :name => 'index_blog_posts_on_user_id')
  end
end
