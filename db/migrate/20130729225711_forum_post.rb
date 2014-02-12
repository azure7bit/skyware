class ForumPost < ActiveRecord::Migration
  def change
  	create_table :forum_posts do |t|
  		t.integer :company_forum_topic_id
  		t.integer :postable_id
  		t.string :postable_type
  		t.text :post_body
  	  t.timestamps
    end
  end
end
