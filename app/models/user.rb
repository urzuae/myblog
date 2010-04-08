class User < ActiveRecord::Base
  validates_presence_of :username, :encrypted_password, :email
  validates_uniqueness_of :username
  before_save :crypt_password
  
  def crypt_password
    self.encrypted_password = Digest::SHA1.hexdigest(encrypted_password) unless encrypted_password.blank?
  end
end
