url = "https://id.twitch.tv/oauth2/token?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&grant_type=client_credentials"
uri = URI.parse(url)
res = Net::HTTP.post_form(uri,{})
token = JSON.parse(res.body)["access_token"]
$client = Twitch::Client.new(client_id: ENV["CLIENT_ID"], access_token: token)