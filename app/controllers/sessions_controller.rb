class SessionsController < ApplicationController
    #skip_before_action :verify_authenticity_token, only: :create
    def twitch_login
        user = User.find_or_create_by(twitch_login_params)
        session[:user_id] = user.id 
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    def twitch_login_params
        {
            name: request.env['omniauth.auth'].info.name,
            provider: request.env['omniauth.auth'].provider,
            uid: request.env['omniauth.auth'].uid
        }
    end
end
