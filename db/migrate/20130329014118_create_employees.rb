class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :business_id
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
