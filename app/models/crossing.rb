class Crossing < ActiveRecord::Base
    belongs_to :father, :class_name => "GeneticBank", :foreign_key => "father_id"
    belongs_to :mother, :class_name => "GeneticBank", :foreign_key => "mother_id"
    #belongs_to :father, :class_name => "GeneticBank", :foreign_key => "father_id", dependent: :destroy
    #belongs_to :mother, :class_name => "GeneticBank", :foreign_key => "mother_id", dependent: :destroy

    #    VALIDATIONS
    validates :codeCross, presence:{ message:"Obligatory"}
    validates :numRepeat,presence:{ message:"Obligatory"}
    validates :year, presence:{message: "Obligatory"}
    validates :numSeeds, presence:{message: "Obligatory"}, if: :numSeedsYes?
    #validates :father_id,presence:{ message:"Obligatory"}, uniqueness: {scope: [:mother_id,:year,:numRepeat], case_sensitive: false, message:"and mother combination already exists in this year, add or change numRepeat"} 
    #validates :mother_id,presence:{ message:"Obligatory"} , uniqueness: {scope: [:father_id,:year,:numRepeat], case_sensitive: false, message:"and father combination already exists in this year, add or change numRepeat"} 

    validates :father_id,presence:{ message:"Obligatory"}, uniqueness: {scope: [:mother_id,:year,:numRepeat], case_sensitive: false, message:"and mother combination already exists in this year, add or change numRepeat"} 
    validates :mother_id,presence:{ message:"Obligatory"} , uniqueness: {scope: [:father_id,:year,:numRepeat], case_sensitive: false, message:"and father combination already exists in this year, add or change numRepeat"} 

    #    funcion para mostrar en el select de seed el codeCross y numRepeat
    def selectCodeNumRepeat
        "#{Crossing.where(id: self.id).first.codeCross}-#{Crossing.where(id: self.id).first.numRepeat}"
    end

    #    numSeeds obligatoy only if effective is selected "yes"
    def numSeedsYes?
        self.effective == "yes"
    end

end
