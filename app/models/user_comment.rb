class UserComment < ActiveRecord::Base
  belongs_to :blog_post
  
  attr_accessible :body, :commenter
  
  validates :commenter, :presence => true
  validates :body, :presence => true

end
