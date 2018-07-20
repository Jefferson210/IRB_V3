class RegistrationsController < Devise::RegistrationsController 
    before_action :authenticate_user!
    def new        
        redirect_to new_user_session_path
    end

    def create
        redirect_to new_user_session_path
    end	
end
