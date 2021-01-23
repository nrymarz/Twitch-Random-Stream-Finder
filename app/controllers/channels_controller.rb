class ChannelsController < ApplicationController
    def show
        @channel = Channel.find_or_create_by_name(params[:id]).try(:name)
        flash[:notice] = "No channel found with that name" if @channel.nil?
    end
end
