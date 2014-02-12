class ConfirmationForOldAdmins < ActiveRecord::Migration
  def up
  	users = SuperAdmin.all
  	users.each do |user|
  		user.confirm!
  	end
  end

  def down
  end
end
