class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    include DeviseTokenAuth::Concerns::User
    #Posibles roles a asignar
    Roles = %w[administrator breeder guest].freeze  

    validates :role, presence:{ message:"Obligatory"}, :allow_blank => false   

end
