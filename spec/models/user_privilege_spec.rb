require 'spec_helper'

describe UserPrivilege do
  fixtures :users, :privileges

  it "should create a new instance given valid attributes" do
    user_privilege = create_user_privilege
    user_privilege.new_record?.should_not be_true
  end
  
  it "should belongs to user" do
    user_privilege = create_user_privilege(:user => nil )
    user_privilege.errors.on(:user_id).should_not be_nil
  end
  
  it "should belongs to privilege" do
    user_privilege = create_user_privilege(:privilege => nil )
    user_privilege.errors.on(:privilege_id).should_not be_nil
  end
  
end

def create_user_privilege (attributes = {})
  attrs = {
    :user => users(:enrique),
    :privilege => privileges(:to_create)
  }.merge(attributes)
  user_privilege = UserPrivilege.new(attrs)
  user_privilege.save if user_privilege.valid?
  user_privilege
end