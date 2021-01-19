class StaticController < ApplicationController
    def home
        @channel = get_random_channel
    end

    def get_random_channel
        streams = $client.get_streams(language:'en', first:100)
        int = rand(10)
        int.times do 
            page = streams.pagination['cursor']
            streams = $client.get_streams(language:'en', first:100, after: page)
        end
        int = rand(100)
        streams.data[int].user_name
    end
end