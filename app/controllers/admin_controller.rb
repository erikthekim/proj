class AdminController < ApplicationController
    layout 'admin'
    before_action :verify_admin
    def index
        
    
    end

    def verify_admin
        redirect_to new_user_session_path unless current_user&.admin?
    end
end