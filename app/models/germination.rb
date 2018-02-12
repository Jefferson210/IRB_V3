class Germination < ActiveRecord::Base
    belongs_to :seed
    has_many :one_offsprings, dependent: :restrict_with_exception

    #VALIDATES
    validates :seed_id,presence:{ message:"Obligatory"} , uniqueness: { scope: [:week],case_sensitive: false, message:"already exists with this week"} 

    validates :week, presence:{ message:"Obligatory"}
    validates :numGerminations, presence:{ message:"Obligatory"},numericality: { less_than_or_equal_to: :missingSeed,  only_integer: true }  
    validate :individualGermination_less_than_individualSeed

    def individualGermination_less_than_individualSeed
        if self.numGerminations.blank?
            puts "errors algo salio mal"
        else
            maxIndividual = Seed.where(codeCross: self.seed.codeCross).select(:id).maximum(:totalCode)           
            puts "Maximo #{maxIndividual}"
            errors.add(:numGerminations, "should be less or equal than total Code #{maxIndividual} from Seed ") if numGerminations >  maxIndividual 
        end
    end
end
