class Asset < ActiveRecord::Base
  belongs_to :blog_post
  
  attr_accessible :usrfile
  has_attached_file :usrfile, :styles => lambda{ |a| ["image/jpeg", "image/png"].include?( a.content_type ) ? { :thumb => "100x100>" } : {}  }
end
