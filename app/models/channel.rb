class Channel < ApplicationRecord
    has_many :recommendations 
    has_many :users, through: :recommendations

    def to_param
        self.name
    end

    def self.find_or_create_by_name(name)
        if name
            begin
                channel_data = $client.get_users(login: name).data
            rescue Twitch::ApiError
                channel_data = []
            end
            unless channel_data.empty?
                channel = Channel.find_by(name: channel_data[0].display_name)
                channel = Channel.create(
                    name: channel_data[0].display_name,
                    description: channel_data[0].description,
                    profile_image_url: channel_data[0].profile_image_url
                ) unless channel
            end
            channel
        end
    end
end
