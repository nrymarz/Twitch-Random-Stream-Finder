class Channel < ApplicationRecord
    has_many :recommendations 
    has_many :users, through: :recommendations

    def to_param
        self.name
    end

    def self.find_or_create_by_name(name)
        channel = Channel.find_by(name: name)
        if channel.nil?
            begin
                channel_data = $client.get_users(login: name).data
            rescue Twitch::ApiError
                channel_data = []
            end
            channel = Channel.create(
                name: channel_data[0].display_name,
                description: channel_data[0].description,
                profile_image_url: channel_data[0].profile_image_url
            ) unless channel_data.empty?
        end
        channel
    end
end
