class CompanyProfile < ActiveRecord::Base
  attr_accessible :company_establishment_date, :company_name, :hq_city, :hq_country, :hq_state, :hq_street_address, :hq_zipcode, :super_admin_id, :website
end
