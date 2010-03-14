# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_epub_hero_session',
  :secret      => '1655469f2b702cd28ef8668d3a29c6fba5ca3fa8e1819ab41d015a36b12d798014758280e79735c248a19736fcf888809fe753add9188ce1e52b3410e8f30c60'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
