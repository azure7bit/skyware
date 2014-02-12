class AddSubdomainToCitizens < ActiveRecord::Migration
  def change
    add_column :citizens, :subdomain, :string
  end
end
