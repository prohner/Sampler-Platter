# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Sampler-Platter_session',
  :secret      => '1d9773cffd995b80b73324434f4655e4cb7cc237b50bffb2ba9748df6e87b95a96767a3119edfdc5e6871485b1a50c3ce9c918e127a2196d765568a5889d044d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
