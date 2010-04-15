require 'spec_helper'

describe Comment do
  fixtures :users, :categories, :posts
  
  it "should create a new instance given valid attributes" do
    comment = create_comment
    comment.new_record?.should_not be_true
  end
  
  it "should validate presence of author" do
    comment = create_comment(:author => '')
    comment.errors.on(:author).should_not be_nil
  end
    
  it "should validate presence of content" do
    comment = create_comment(:content => '')
    comment.errors.on(:content).should_not be_nil
  end
  
  it "should belongs to post" do
    comment = create_comment(:post => nil)
    comment.errors.on(:post_id).should_not be_nil
  end
  
end


def create_comment(attributes = {})
  attrs = {
    :author => 'Lorem Ipsum',
    :content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
    :url => 'http://www.google.com',
    :post => posts(:ipsum)
  }.merge(attributes)
  comment = Comment.new(attrs)
  comment.save if comment.valid?
  comment
end