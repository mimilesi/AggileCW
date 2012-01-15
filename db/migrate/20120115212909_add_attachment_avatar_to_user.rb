class AddAttachmentAvatarToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :avatar_file_name, :string
    change_column :users, :avatar_content_type, :string
    change_column :users, :avatar_file_size, :integer
    change_column :users, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
  end
end
