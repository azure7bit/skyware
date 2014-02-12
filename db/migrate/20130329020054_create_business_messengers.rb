class CreateBusinessMessengers < ActiveRecord::Migration
  def change
    create_table :business_messengers do |t|
      t.integer :super_admin_id
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end
