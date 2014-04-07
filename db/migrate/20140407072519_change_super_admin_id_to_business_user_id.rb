class ChangeSuperAdminIdToBusinessUserId < ActiveRecord::Migration
  def change
  	rename_column :company_profiles, :super_admin_id, :business_user_id
  	rename_column :business_messengers, :super_admin_id, :business_user_id
  	rename_column :company_forums, :super_admin_id, :business_user_id
  	rename_column :online_stores, :super_admin_id, :business_user_id
  	rename_column :products, :super_admin_id, :business_user_id
  end
end
