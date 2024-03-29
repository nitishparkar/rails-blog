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
    "<strong>" + tags_list.map { |tag| link_to tag, tag_path(:tag => tag) } .join('</strong>, <strong>') + "</strong>"
  end

  def get_link(asset)
      ret = "<div class=\"field\">"
      if asset.object.usrfile_content_type.include? 'image'
          ret += link_to(image_tag(asset.object.usrfile.url(:thumb)), asset.object.usrfile.url)
      else
          ret += link_to(asset.object.usrfile_file_name , asset.object.usrfile.url)
      end
      ret += asset.check_box :_destroy
      ret += asset.label :_destroy, 'Remove'
      ret += "</div>"
  end

  def get_attachments(assets)
      ret = ""
      for asset in assets
        ret += "<div class=\"attachment\">"
        if asset.usrfile_content_type.include? 'image'
            ret += link_to(image_tag(asset.usrfile.url(:thumb)), asset.usrfile.url)
        else
            ret += link_to(asset.usrfile_file_name , asset.usrfile.url)
        end
        ret += "</div>"
      end
      ret
  end
end
