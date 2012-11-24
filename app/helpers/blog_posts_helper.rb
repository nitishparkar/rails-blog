module BlogPostsHelper
  
  def get_username(user_id)
    usr = User.find(user_id)
    if usr
        return usr.username
    else
        return "unknown"
    end
  end

  def is_authorized?(user_id)
    user_id == current_user.id
  end

  def format_tags(tags_list)
    tags_list.map { |tag| link_to tag, tag_path(:tag => tag) } .join(', ')
  end
end
