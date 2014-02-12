class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
    	t.string :email
    	t.string :password
    	t.string :password_confirmation
    	t.integer :business_id
    	t.string :first_name
    	t.string :last_name
    	t.string :title

      t.timestamps
    end
  end
end
