# Be sure to restart your server when you modify this file.

SkyhqNew::Application.config.session_store :cookie_store, key: '_skyhq-new_session', domain: Rails.env.development? ? 'lvh.me' : 'skyhq.com'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# SkyhqNew::Application.config.session_store :active_record_store
