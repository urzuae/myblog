require 'spec_helper'

describe Post do
  fixtures :users, :categories
  
  it "should create a new instance given valid attributes" do
    post = create_post
    violated "#{post.errors.full_messages.to_sentence}" if post.new_record?
  end
  
  it "should validate presence of title" do
    post = create_post(:title => '')
    post.errors.on(:title).should_not be_nil
  end
  
  it "should validate uniqueness of title" do
    create_post(:title => "lorem")
    post = create_post(:title => "lorem")
    post.errors.on(:title).should_not be_nil
  end
  
  it "should validate presence of content" do
    post = create_post(:content => '')
    post.errors.on(:content).should_not be_nil
  end
  
  it "should belongs to user" do
    post = create_post(:user => nil)
    post.errors.on(:user_id).should_not be_nil
  end
  
  it "should belongs to category" do
    post = create_post(:category => nil)
    post.errors.on(:category_id).should_not be_nil
  end
end


def create_post(attributes = {})
  attrs = {
    :title => 'Lorem Ipsum',
    :content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
    :user => users(:enrique),
    :category => categories(:tech)
  }.merge(attributes)
  post = Post.new(attrs)
  post.save if post.valid?
  post
end