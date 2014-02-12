class CreateOnlineStores < ActiveRecord::Migration
  def change
    create_table :online_stores do |t|
      t.integer :super_admin_id
      t.string :name

      t.timestamps
    end
  end
end
