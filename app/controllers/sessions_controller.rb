class SessionsController < ApplicationController
    before_action :redirect_if_already_logged_in, except: [:destroy,:create,:twitch_login]
    def new 
        @user = User.new
    end

    def new_twitch
        redirect_to '/auth/twitch' if !logged_in?
    end

    def create
        user = User.find_by(name: user_params[:name])
        if user && user.authenticate(user_params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path, notice: "Failed to login."
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
