class AddSocialLinksToCitizen < ActiveRecord::Migration
  def change
    add_column :citizens, :facebook, :string
    add_column :citizens, :twitter, :string
    add_column :citizens, :linkedin, :string
    add_column :citizens, :flickr, :string
    add_column :citizens, :pinterest, :string
    add_column :citizens, :tumblr, :string
    add_column :citizens, :dropbox, :string
    add_column :citizens, :google_plus, :string
    add_column :citizens, :instagram, :string
    add_column :citizens, :github, :string
    add_column :citizens, :bitbucket, :string
    add_column :citizens, :vk, :string
  end
end
