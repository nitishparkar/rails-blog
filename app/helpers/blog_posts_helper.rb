module BlogPostsHelper
  def join_tags(post)
    post.post_tags.map { |t| t.name }.join(", ")
  end

  def get_username(user_id)
    usr = User.find(user_id)
    if usr
        return usr.username
    else
        return "unknown"
    end
  end
end
