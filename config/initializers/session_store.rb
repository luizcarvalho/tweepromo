# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tweepromo_session',
  :secret      => 'dec3618dee572ce9a02496b31313a3230f3b950935f3f4bace20be646f0733671c224c85dacdd36e89bc6481a4c42842ad333cec18f08ba8b7bf25f06a9de142'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
