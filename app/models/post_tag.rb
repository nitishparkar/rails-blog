class PostTag < ActiveRecord::Base
  belongs_to :blog_post
  attr_accessible :name
end
