class UsersController < ApplicationController
    before_action :redirect_if_already_logged_in, only:[:new]
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        redirect_if_not_current_user
        @user = User.find(params[:id])
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            redirect_to root_path
        else
            redirect_to new_user_path, notice: "you did something wrong"
        end
    end

    def update 
    end

    private

    def user_params
        params.require(:user).permit(:name,:password)
    end

end
