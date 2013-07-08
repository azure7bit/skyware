class AddColumnsToBusiness < ActiveRecord::Migration
  def change
  	add_column :businesses, :street, :string
  	add_column :businesses, :city, :string
  	add_column :businesses, :state, :string
  	add_column :businesses, :zipcode, :string
  	add_column :businesses, :country, :string
  	add_column :businesses, :gmaps, :string
  end
end
