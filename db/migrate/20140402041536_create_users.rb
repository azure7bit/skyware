class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :subdomain
      t.integer :owner_id
      t.timestamps
    end

    add_index :users, :owner_id
  end
end