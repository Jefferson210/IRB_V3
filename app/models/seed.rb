class Seed < ActiveRecord::Base
    belongs_to :crossing
    has_many :germinations, dependent: :restrict_with_exception

    #    VALIDATIONS
    validates :crossing_id, presence:{ message:"Obligatory"}, uniqueness: {case_sensitive: false, message:"already exists"}
    validates :sowDate, presence:{ message:"Obligatory"}


    def codeCross_numRepeat
        "#{crossing.codeCross}-#{crossing.numRepeat}"
    end

    def sumaTotalCode
        Seed.sum(:numSeeds) # => 4562
    end
end
