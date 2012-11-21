class BlogPost < ActiveRecord::Base
  attr_accessible :content, :name, :title, :post_tags_attributes

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }

  has_many :user_comments, :dependent => :destroy
  has_many :post_tags

  accepts_nested_attributes_for :post_tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
