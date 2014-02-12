class CompanyForumTopic < ActiveRecord::Migration
  def change
  	create_table :company_forum_topics do |t|
  		t.integer :company_forum_id
  		t.string :topic_title
  		t.string :user_type
  		t.integer :topic_creator_id
  	  t.timestamps
    end
  end
end
