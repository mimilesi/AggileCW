class AddAdminToUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :admin
  end
end