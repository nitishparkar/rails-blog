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
end
