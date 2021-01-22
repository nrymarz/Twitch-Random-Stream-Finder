class Recommendation < ActiveRecord::Base
    belongs_to :user
    belongs_to :channel

    validates :content, length: {minimum: 20}

    def channel_name=(name)
        channel = Channel.find_by(name: name)
        if !channel
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
        self.channel = channel
    end

    def channel_name 
        self.channel.name if self.channel
    end

        
end