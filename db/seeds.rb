# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SuperAdmin.destroy_all
CompanyProfile.destroy_all
Business.destroy_all
# Employee.destroy_all
OnlineStore.destroy_all
Manager.destroy_all
Product.destroy_all

SuperAdmin.create(:email => "super1@example.com", :password => "hockeyhockey", :password_confirmation => "hockeyhockey", :name => "Super Admin 1", :first_name => "Super Admin", :last_name => "1", :phone_number => "312-401-1000", :location => "Chicago")
SuperAdmin.create(:email => "super2@example.com", :password => "hockeyhockey", :password_confirmation => "hockeyhockey", :name => "Super Admin 2", :first_name => "Super Admin", :last_name => "2", :phone_number => "312-401-1002", :location => "New York City")

CompanyProfile.create(:company_establishment_date => Time.now - 10.months, :company_name => "Acme Pro Corp", :hq_city => "Los Angeles", :hq_state => "California", :hq_street_address => "111 Rodeo Drive", :hq_zipcode => "90200", :super_admin_id => SuperAdmin.first.id, :website => "http://acmepro.com")
CompanyProfile.create(:company_establishment_date => Time.now - 2.years, :company_name => "Dynasty Coal Corp", :hq_city => "Salt Lake City", :hq_state => "Utah", :hq_street_address => "555 Miners Drive", :hq_zipcode => "12345", :super_admin_id => SuperAdmin.last.id, :website => "http://dynastycoal.com")
