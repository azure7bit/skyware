source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development do
  gem 'sqlite3'
end
gem 'mysql2'
gem 'simplecov', :require => false, :group => :test
group :development, :test do
  gem "rspec-rails", "~> 2.14.1"
  gem "factory_girl_rails", "~> 4.3.0"
end

group :production do 
  gem 'pg'
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.

gem 'jquery-rails'

gem 'devise'
gem "cancan"
gem "omniauth-google-oauth2"
gem 'simple_form'
# gem 'tire'
gem "font-awesome-rails"
gem "blogit", github: "KatanaCode/blogit", branch: "master"
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem 'compass-h5bp'
  gem "therubyracer"
  gem "less-rails"
end

gem 'gmaps4rails'

#attachment uploading
gem 'paperclip'
gem 'aws-sdk'

#ping
gem 'newrelic_rpm'

#messaging system
gem 'mailboxer'

#country select
gem 'country_select'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
