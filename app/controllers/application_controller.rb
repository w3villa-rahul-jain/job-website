class ApplicationController < ActionController::Base
    helper_method :current_user

    # def current_user
    #   if session[:user_id]
    #     @current_user  = User.find(session[:user_id])
    #   end
    # end

    # def log_in(user)
    #   session[:user_id] = user.id
    #   @current_user = user
    #   redirect_to root_path
    # end

    # def logged_in?
    #   !current_user.nil?
    # end

    # def log_out
    #   session.delete(:user_id)
    #   @current_user = nil
    # end

    def after_sign_in_path_for(resource_or_scope)
        jobs_path
      end

    def after_sign_out_path_for(resource_or_scope)
      new_user_registration_path
    end
end
