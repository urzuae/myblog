class User < ActiveRecord::Base
  validates_presence_of :username, :encrypted_password, :email
  validates_uniqueness_of :username
  
  def check_fields
    if self.encrypted_password.blank?
      errors.add(:encrypted_password, :blank)
    end
  end
  
  def crypt_password
    self.encrypted_password = Digest::SHA1.hexdigest(encrypted_password)
  end
end
