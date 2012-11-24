class BlogPost < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tag_list

  validates :title, :presence => true, :length => { :minimum => 5 }
  validates :content, :presence => true, :length => { :minimum => 10 }

  belongs_to :user
  has_many :user_comments, :dependent => :destroy

  acts_as_taggable_on :tags
end
