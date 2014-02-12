class AddColumnToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :online_store_id, :integer
  end
end
