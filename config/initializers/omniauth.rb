Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitch, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"], {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
end