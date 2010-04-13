class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates_presence_of :title, :user_id, :category_id, :content
end
