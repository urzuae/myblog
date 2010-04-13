class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :content, :author, :url
  validates_format_of :url, :with => /^https?:\/\/[a-z\d]{1,}(\.[a-z\d]{1,}){1,}$/i 
end
