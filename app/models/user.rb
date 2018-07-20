class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    include DeviseTokenAuth::Concerns::User
    #Posibles roles a asignar
    Roles = %w[administrator breeder guest].freeze  

    validates :role, presence:{ message:"Obligatory"}, :allow_blank => false    

    def active_for_authentication?
        # Uncomment the below debug statement to view the properties of the returned self model values.
        # logger.debug self.to_yaml
        super && role != "guest" ? true : false
    end

    def inactive_message        
        role != "guest" ? super : :guest_user
    end

end
