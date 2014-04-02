class AddBusinessInfoToSuperadmin < ActiveRecord::Migration
  def change
  	add_column :super_admins, :business_type, :string
  	add_column :super_admins, :business_name, :string
  end
end
