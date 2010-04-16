class CreateUserPrivileges < ActiveRecord::Migration
  def self.up
    create_table :user_privileges do |t|
      t.integer :user_id
      t.integer :privilege_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_privileges
  end
end
