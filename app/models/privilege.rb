class Privilege < ActiveRecord::Base
  has_many :user_privileges
  has_many :users, :through => :user_privileges 
end
