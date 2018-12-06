class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def require_admin
      redirect_to controller: 'application', action: 'home' unless current_user.admin
    end

    def require_login
      redirect_to controller: 'application', action: 'home' unless logged_in?
    end
end
