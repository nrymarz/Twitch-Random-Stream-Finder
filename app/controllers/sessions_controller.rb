class SessionsController < ApplicationController
    #skip_before_action :verify_authenticity_token, only: :create
    def new 
        @user = User.new
    end

    def create
        user = User.find_by(user_params[:name])
        if user && user.authenticate(user_params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path notice: "Failed to login."
        end
    end

    def twitch_login
        user = User.find_or_create_by(twitch_login_params)
        session[:user_id] = user.id 
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def twitch_login_params
        {
            name: request.env['omniauth.auth'].info.name,
            provider: request.env['omniauth.auth'].provider,
            uid: request.env['omniauth.auth'].uid
        }
    end

    def user_params
        params.require(:user).permit(:password,:name)
    end
end
