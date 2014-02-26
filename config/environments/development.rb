SkyhqNew::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
  config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  config.assets.precompile += %w( .svg .eot .woff .ttf)

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {:address => "localhost", :port => 1025}
  
  ENV['GOOGLE_APP_ID'] = '65276596025-541tfg7nvjcftlnbt9p38at9tkbvvb0l.apps.googleusercontent.com'
  ENV['GOOGLE_APP_SECRET'] = 'Wik1RvRe2PybEU3pOLr0LO33'
  
  ENV['AWS_BUCKET'] = 'skyhq-dev'
  ENV['AWS_ACCESS_KEY_ID'] = 'AKIAJIVNCEZEJGZSFZUA'
  ENV['AWS_SECRET_ACCESS_KEY'] = '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'
  config.paperclip_defaults = { storage: :s3, s3_credentials: { bucket: 'skyhq-dev', access_key_id: 'AKIAJBJNGQPG5Z6Q5WWQ', secret_access_key:  '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'}, s3_host_name: 's3-us-west-2.amazonaws.com' }  

end
