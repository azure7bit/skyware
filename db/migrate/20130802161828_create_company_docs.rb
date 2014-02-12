class CreateCompanyDocs < ActiveRecord::Migration
  def change
    create_table :company_docs do |t|
    	t.attachment :company_document
    	t.integer :uploader_id
    	t.string :uploader_type
    	t.integer :company_forum_id
      t.timestamps
    end
  end
end
