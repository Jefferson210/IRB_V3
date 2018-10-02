class SessionsController < Devise::SessionsController
    def new
        super
    end

    def create        
        @user = User.where(email: sign_in_params[:email])
        if  @user.exists?
            arrayUser = @user.to_a
            if arrayUser[0][:role] != "guest"
                super
            else
                flash[:alert] = "Invalid email or password" 
                redirect_to action: "new"
            end   
        else
            flash[:alert] = "Invalid email or password" 
            redirect_to action: "new"
        end
    end
end