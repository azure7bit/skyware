class RenameUserToCitizen < ActiveRecord::Migration
  def change
  	rename_table :users, :citizens
  end
end
