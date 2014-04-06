class DropTableUsers < ActiveRecord::Migration
  def change
  	drop_table :users
  	drop_table :managers
  	rename_table :super_admins, :business_users
  end
end
