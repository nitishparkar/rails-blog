class BlogPost < ActiveRecord::Base
  attr_accessible :content, :name, :title

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }

  has_many :user_comments, :dependent => :destroy
end