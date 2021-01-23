class ChannelsController < ApplicationController
    def show
        @channel = Channel.find_by_name(params[:id]).name
        flash[:notice] = "No one has made a recommendation for this channel yet" if @channel.nil?
    end
end
