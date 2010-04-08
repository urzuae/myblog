class User < ActiveRecord::Base
  has_many :posts
  
  validates_presence_of :username, :encrypted_password, :email
  validates_uniqueness_of :username
  before_save :encrypt_password
  
  def encrypt_password
    self.encrypted_password = self.class.crypt_password(self.encrypted_password)
  end
  
  def self.crypt_password(password)
    Digest::SHA1.hexdigest(password) unless password.blank?
  end
end
