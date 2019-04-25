class GeneticBank < ActiveRecord::Base
    belongs_to :color
    #    relacion para especificar el nombre de la FK 
    #    Con :restrict_with_exception lanza una excepción cuando se invoca a destruir en un registro padre con hijos
    has_many :fathers, :class_name => "Crossing", :foreign_key => "father_id", dependent: :restrict_with_exception 
    has_many :mothers, :class_name => "Crossing", :foreign_key => "mother_id", dependent: :restrict_with_exception

    #    relacion para agregar varias imagenes a una variedad
    has_many :genetic_bank_pictures, dependent: :destroy
    #    belongs_to :genetic_bank_picture, dependent: :destroy
    #    self.primary_keys = :location

    #    VALIDATIONS
    validates :code, presence:{message: "Obligatory"}, :allow_blank => false, uniqueness: {case_sensitive: false, message:"already exists"}    
    validates :location, presence:{ message:"Obligatory"}, :allow_blank => false

    validates :trademark,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}
    validates :denomination,:allow_blank => true, uniqueness: {case_sensitive: false, message:"already exists"}

    validates :status, presence:{ message:"Obligatory"}, :allow_blank => false

    validate :location_exists, on: :update
    validate :code_exists, on: :update

    #    comprobar si existe un campo con el mismo location
    def location_exists
        if self.location_changed?
            if GeneticBank.exists?(self.location)
                errors.add(:location, "already exists")
            end
        end
    end

    #    comprobar si existe un campo con el mismo code
    def code_exists
        if self.code_changed?
            if GeneticBank.exists?(self.code)
                errors.add(:code, "already exists")
            end
        end
    end

    #    funcion para mostrar en el select de crossing el code y trademark
    def selectCodeTrademark
        "#{GeneticBank.where(id: self.id).first.code}-#{GeneticBank.where(id: self.id).first.trademark}"
    end
    
#    obtener el nombre de una imagen
    def getPictureName
        "#{GeneticBankPicture.where(id: self.PictureId).first.picture_file_name}"
    end


end



