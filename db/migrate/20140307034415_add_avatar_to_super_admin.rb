class AddAvatarToSuperAdmin < ActiveRecord::Migration
  def self.up
    add_attachment :super_admins, :avatar
  end

  def self.down
    remove_attachment :super_admins, :avatar
  end
end
