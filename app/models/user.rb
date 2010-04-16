class User < ActiveRecord::Base

  has_many :posts
  has_many :user_privileges
  has_many :privileges, :through => :user_privileges 
  validates_presence_of :username, :encrypted_password, :email
  validates_uniqueness_of :username, :email
  before_save :encrypt_password
  
  def encrypt_password
    self.password_salt = self.class.crypt_password([Time.now, rand(100)].join(""))
    self.encrypted_password = self.class.crypt_password(self.encrypted_password + self.password_salt)
  end
    
  def self.crypt_password(password)
    Digest::SHA1.hexdigest(password) unless password.blank?
  end
  
  def valid_password?(password)
    logger.info(password_salt)
    User.crypt_password(password + self.password_salt) == self.encrypted_password
  end
    
end
