class TaglineToSuperAdmin < ActiveRecord::Migration
  def change
    add_column :super_admins, :title_tagline, :string
    add_column :super_admins, :tagline, :text
  end
end
