# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yogle_session',
  :secret      => '3ad93a793dce6aa1b5588a5ffcf5585084e17d579e31b7ed1a2db5d12bd75ffda9f68a649ea2928f51223dda00777e1e9ee92190d97508128188186907875207'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
