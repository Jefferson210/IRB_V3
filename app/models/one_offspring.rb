class OneOffspring < ActiveRecord::Base
    belongs_to :germination
    belongs_to :color
    has_many :two_offsprings, dependent: :restrict_with_exception
    #    relacion para agregar varias imagenes a una variedad
    has_many :one_offspring_pictures, dependent: :destroy

    #    VALIDATIONS
    validates :germination_id, presence:{ message:"Obligatory"}, uniqueness: { scope: [:individual],case_sensitive: false, message:"already exists with this individual"}
    validates :individual, presence:{ message:"Obligatory"}

    #    validate :individualOneOffspring_less_than_totalCodeCrossGermination, :on => :save
    validate :individualOneOffspring_less_than_totalCodeCrossGermination

    def individualOneOffspring_less_than_totalCodeCrossGermination
        #        errors.add(:individual, "should be less or equal than individual of Germination") if individual > germination.numGerminations

        if self.individual.blank?
            puts "errors algo salio mal"
        else
            maxIndividual = Germination.where(codeCross: self.germination.codeCross).select(:id,:codeCross,:totalCode).sum(:totalCode)
            puts "Maximo #{maxIndividual}"
            errors.add(:individual, "should be less or equal than total Code #{maxIndividual} from Germination ") if individual >  maxIndividual
        end
    end

    def codeCross_name
        "#{germination.seed.crossing.codeCross}-#{OneOffspring.where(id: self.id).first.individual}"
    end

    #    obtener el nombre de una imagen
    def getPictureName
        "#{OneOffspringPicture.where(id: self.PictureId).first.picture_file_name}"
    end

end

