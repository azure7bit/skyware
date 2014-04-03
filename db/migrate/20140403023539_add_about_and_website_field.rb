class AddAboutAndWebsiteField < ActiveRecord::Migration
  def change
  	add_column :super_admins, :about, :text
  	add_column :super_admins, :website, :string
  end
end
