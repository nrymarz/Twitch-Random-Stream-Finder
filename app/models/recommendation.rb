class Recommendation < ActiveRecord::Base
    belongs_to :user
    belongs_to :channel

    validates :content, length: {minimum: 20}

    def channel_name=(name)
        channel = Channel.find_or_create_by_name(name)
        self.channel = channel
    end

    def channel_name 
        self.channel.try(:name)
    end

        
end