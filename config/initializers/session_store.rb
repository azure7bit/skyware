# Be sure to restart your server when you modify this file.

SkyhqNew::Application.config.session_store :cookie_store, key: '_skyhq_new_session', domain: Rails.env.development? ? 'lvh.me' : 'skyhq.com'
