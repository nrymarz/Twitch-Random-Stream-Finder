Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer
    provider :twitch, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"]
end