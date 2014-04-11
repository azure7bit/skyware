class AddPermissionBlogComment < ActiveRecord::Migration
  def change
  	add_column :blogit_posts, :allow_comment, :boolean, :dafault => false
  end
end
