class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
        if logged_in?
            redirect_to login_path, alert: "You Must Log In to See That Page"
        else
            yield
        end
    end

    def redirect_if_not_current_user
        return head(403) unless session[:user_id] == params[:id].to_i
    end

    def redirect_if_already_logged_in
        redirect_to root_path, notice: "You are already logged in." if logged_in?
    end
end
