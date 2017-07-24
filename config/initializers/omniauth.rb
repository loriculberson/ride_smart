# OmniAuth.config.logger = Rails.logger
# OmniAuth.config.full_host = Rails.env.production? ? 'https://ride-smart.herokuapp.com' : 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"]
end

  # provider :google_oauth2, 'my Google client id', 'my Google client secret', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
