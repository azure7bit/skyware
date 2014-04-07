class ChangeForeignKeySuperAdminId < ActiveRecord::Migration
  def change
  	rename_column :locations, :super_admin_id, :business_user_id
  end
end
