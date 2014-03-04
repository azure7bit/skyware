class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :citizens, :avatar
  end

  def self.down
    remove_attachment :citizens, :avatar
  end
end
