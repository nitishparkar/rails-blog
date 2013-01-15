class BlogPost < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tag_list, :assets_attributes

  validates :title, :presence => true, :length => { :minimum => 5 }
  validates :content, :presence => true, :length => { :minimum => 10 }

  belongs_to :user
  has_many :user_comments, :dependent => :destroy
  has_many :assets, :dependent => :destroy

  accepts_nested_attributes_for :assets, :allow_destroy => true

  acts_as_taggable_on :tags

  def next
  	BlogPost.where("id > ?", id).first
  end

  def prev
  	BlogPost.where("id < ?", id).last
  end
end
