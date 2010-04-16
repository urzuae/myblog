class CreatePrivileges < ActiveRecord::Migration
  def self.up
    create_table :privileges do |t|
      t.string :permission

      t.timestamps
    end
  end

  def self.down
    drop_table :privileges
  end
end
