class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :business_id
      t.string :name
      t.string :password
      t.string :password_confirmation
      t.string :email

      t.timestamps
    end
  end
end
