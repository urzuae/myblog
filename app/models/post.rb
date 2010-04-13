class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates_presence_of :title, :user_id, :category_id, :content
  validates_uniqueness_of :title
  
  def to_param
    title
  end
end
