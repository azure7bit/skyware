class RemoveForumReferenceFromDocument < ActiveRecord::Migration
  def up
  	remove_column :company_docs, :company_forum_id
  end

  def down
  	add_column :company_docs, :company_forum_id, :integer
  end
end
