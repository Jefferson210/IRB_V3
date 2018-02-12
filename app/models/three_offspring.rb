class ThreeOffspring < ActiveRecord::Base
    belongs_to :two_offspring
    has_many :irb_selections, dependent: :restrict_with_exception

    #    relacion para agregar varias imagenes a una variedad
    has_many :three_offspring_pictures, dependent: :destroy

    #    VALIDATIONS
    validates :two_offspring_id, presence:{ message:"Obligatory"}, uniqueness: {case_sensitive: false, message:"already exists"}
    #validates :individual, presence:{ message:"Obligatory"}

    def codeCross_name
        "#{two_offspring.one_offspring.germination.seed.crossing.codeCross}-#{two_offspring.one_offspring.individual}"
    end

end
