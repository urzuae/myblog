class AddUserIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
    
    # Post.all.each do |post|
    #   post.user_id = 1
    #   post.save!
    # end
  end

  def self.down
    remove_column :posts, :user_id
  end
end
