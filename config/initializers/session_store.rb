# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my_blog_session',
  :secret      => 'f5c8bce84d7465d9c09f9ac45395aaa23f68634f4b5bab47efdd9a5b9fb8e12ce283f677278d351eb838500c72812f539a04f54753c995fbee551a0ca6229a33'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
