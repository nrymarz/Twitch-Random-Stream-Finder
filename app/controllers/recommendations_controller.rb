class RecommendationsController < ApplicationController
    def index #add profile images
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @recommendations = user.recommendations
        else
            @recommendations = Recommendation.all
        end
    end

    def show
        if params[:user_id]
            @recommendation = User.find_by(id: params[:user_id]).try(:recommendations).find_by(id: params[:id])
        else
            @recommendation = Recommendation.find_by(id: params[:id])
        end
        redirect_to recommendations_path, notice: "We couldn't find that recommendation" if @recommendation.nil?
    end

    def new
        redirect_if_not_current_user
        @user = current_user
        @recommendation = Recommendation.new(channel_name: params[:channel_name])
    end

    def edit
        redirect_if_not_current_user
        @user = current_user
        @recommendation = Recommendation.find_by(id: params[:id])
        redirect_to recommendations_path, notice: "No recommendation found with that ID" if @recommendation.nil?
    end

    def create
        @recommendation = Recommendation.new(recommendation_params)
        if @recommendation.save
            redirect_to recommendation_path(@recommendation)
        else
            @user = current_user
            render 'new'
        end
    end

    def update
        @recommendation = Recommendation.find(params[:id])
        @recommendation.update(recommendation_params)
        if @recommendation.valid?
            redirect_to recommendation_path(@recommendation)
        else
            @user = current_user
            render 'edit'
        end
    end

    private 

    def recommendation_params
        params.require(:recommendation).permit(:channel_name,:content,:user_id)
    end
end
