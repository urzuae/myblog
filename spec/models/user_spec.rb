require 'spec_helper'

describe User do
  
  it "should create a new instance given valid attributes" do
    user = create_user
    user.new_record?.should_not be_true
  end

  it "should validate presence of username" do
    user = create_user(:username => '')
    user.errors.on(:username).should_not be_nil
  end

  it "should validate uniqueness of username" do
    create_user(:username => "Henry")
    user = create_user(:username => "Henry")
    user.errors.on(:username).should_not be_nil
  end

  it "should validate presence of email" do
    user = create_user(:email => '')
    user.errors.on(:email).should_not be_nil
  end

  it "should validate uniqueness of email" do
    create_user(:email => "hola@gmail.com")
    user = create_user(:email => "hola@gmail.com")
    user.errors.on(:email).should_not be_nil
  end

  it "should validate presence of encrypted_password" do
    user = create_user(:encrypted_password => '')
    user.errors.on(:encrypted_password).should_not be_nil
  end

end

def create_user(attributes = {})
  attrs = {
    :username => 'Enriquito',
    :email => "enriquito@gmail.com",
    :encrypted_password => 'asdasd'
  }.merge(attributes)
  user = User.new(attrs)
  user.save if user.valid?
  user
end
