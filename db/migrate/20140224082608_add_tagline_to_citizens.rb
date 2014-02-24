class AddTaglineToCitizens < ActiveRecord::Migration
  def change
    add_column :citizens, :title_tagline, :string
    add_column :citizens, :tagline, :text
  end
end
