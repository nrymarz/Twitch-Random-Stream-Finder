class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
        redirect_to root_path, notice: "You must be logged in to see that page." unless logged_in?
    end

    def redirect_if_not_current_user
        redirect_if_not_logged_in
        id = params[:user_id] || params[:id]
        return head(403) unless session[:user_id] == id.to_i
    end

    def redirect_if_already_logged_in
        redirect_to root_path, notice: "You are already logged in." if logged_in?
    end
end
