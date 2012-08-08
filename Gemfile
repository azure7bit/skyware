source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'mysql2'
gem 'jquery-rails'
gem 'html5-rails'
#gem 'locomotive_cms', '~> 2.0.0.rc9', :require => 'locomotive/engine'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem 'compass-rails'
  gem 'compass-h5bp'
end

group :utils do
  gem 'log4r'        # Logging
  gem 'rconfig'      # Configuration
  gem 'simple_form'  # Form generation helper
  gem 'chronic'      # Natural language Date
  gem 'inherited_resources' # Rest action utility
  gem 'activeadmin'  # Admin Rails Engine
  gem 'meta_search'  # OO Searching/Search Forms
  gem 'tld'          # Top Level Domains
  gem 'will_paginate'  
  gem 'iso_country_codes'
  gem 'addressable'
end

group :security do
  gem 'oauth'
  gem 'devise'       # Authentication
  gem 'cancan'       # Authorization
  gem 'friendly_id'  # permalink user routing
end

group :omniauth do
  gem 'omniauth'     # Multi-provider Authentication Services
  gem 'omniauth-facebook'
  gem 'omniauth-twitter'
  gem 'omniauth-linkedin'
  gem 'omniauth-identity'
end

group :apis do
  gem 'fb_graph', require: 'fb_graph' # Facebook Graph API
  gem 'linkedin', require: 'linkedin' # LinkedIn API
  gem 'twitter',  require: 'twitter'  # Twitter API
end

group :images do
  gem 'mini_magick'
  gem 'carrierwave'
  gem 'fog'
end

gem 'awesome_print', group: 'development'

group :development, :test do
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'ruby-prof'
end

group :test do
  gem 'redgreen'
  gem 'shoulda'
  gem 'nokogiri'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'fabrication'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'spork'
  gem 'fakeweb'
  gem 'ZenTest'
  gem 'autotest'
  gem 'autotest-rails'
  gem 'autotest-growl'
end
