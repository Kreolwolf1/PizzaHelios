class CreateUsersRoles < ActiveRecord::Migration
  def self.up
    create_table :users_roles do |t|
      t.references :user
      t.references :role

      t.timestamps
    end
  end

  def self.down
    drop_table :users_roles
  end
end
