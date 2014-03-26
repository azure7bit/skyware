class AddTypePostBlog < ActiveRecord::Migration
  def change
  	add_column :blogit_posts, :post_type, :string
  end
end
