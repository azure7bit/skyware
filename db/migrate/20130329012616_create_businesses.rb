class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :super_admin_id
      t.string :name
      t.string :location
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
