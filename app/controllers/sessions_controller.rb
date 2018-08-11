class SessionsController < Devise::SessionsController
    def new
        super
    end

    def create        
        @user = User.where(email: sign_in_params[:email])
        arrayUser = @user.to_a
        if arrayUser[0][:role] != "guest"
            super
        else
            flash[:error] = "Invalid email or password" 
            redirect_to action: "new"
        end        
    end
end