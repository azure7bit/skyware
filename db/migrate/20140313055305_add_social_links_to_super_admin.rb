class AddSocialLinksToSuperAdmin < ActiveRecord::Migration
  def change
    add_column :super_admins, :facebook, :string
    add_column :super_admins, :twitter, :string
    add_column :super_admins, :linkedin, :string
    add_column :super_admins, :flickr, :string
    add_column :super_admins, :pinterest, :string
    add_column :super_admins, :tumblr, :string
    add_column :super_admins, :dropbox, :string
    add_column :super_admins, :google_plus, :string
    add_column :super_admins, :instagram, :string
    add_column :super_admins, :github, :string
    add_column :super_admins, :bitbucket, :string
    add_column :super_admins, :vk, :string
  end
end
