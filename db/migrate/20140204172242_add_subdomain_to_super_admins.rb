class AddSubdomainToSuperAdmins < ActiveRecord::Migration
  def change
    add_column :super_admins, :subdomain, :string
  end
end
