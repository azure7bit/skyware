class RenameBusinessesToLocations < ActiveRecord::Migration
  def change
  	rename_table :businesses, :locations
  	rename_column :managers, :business_id, :location_id
  end
end
