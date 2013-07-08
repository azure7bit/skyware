class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.integer :super_admin_id
      t.string :company_name
      t.string :website
      t.string :hq_street_address
      t.string :hq_city
      t.string :hq_state
      t.string :hq_zipcode
      t.string :hq_country
      t.datetime :company_establishment_date

      t.timestamps
    end
  end
end
