class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates_presence_of :title
end
