class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    #helper_method :current_user
    

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
    end
   
   # def current_user
    #   return unless session[:user_id]
     # @current_user ||= User.find(session[:user_id])
    #end
    
    
    
end
