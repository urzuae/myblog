require 'spec_helper'

describe Category do
  
  it "should create a new instance given valid attributes" do
    category = create_category
    category.new_record?.should_not be_true
  end
  
  it "should validate presence of name" do
    category = create_category(:name => '')
    category.errors.on(:name).should_not be_nil
  end

  it "should validate uniqueness of name" do
    create_category(:name => "lorem")
    category = create_category(:name => "lorem")
    category.errors.on(:name).should_not be_nil
  end
  
end

def create_category(attributes = {})
  attrs = {
    :name => 'Lorem Ipsum',
  }.merge(attributes)
  category = Category.new(attrs)
  category.save if category.valid?
  category
end
