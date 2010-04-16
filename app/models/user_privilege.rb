class UserPrivilege < ActiveRecord::Base
  belongs_to :user
  belongs_to :privilege
  validates_presence_of :user_id, :privilege_id
end
