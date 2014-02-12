class CompanyForum < ActiveRecord::Migration
  def change
  	create_table :company_forums do |t|
  		t.integer :super_admin_id
  		t.string :title
  	  t.timestamps
    end
  end
end
