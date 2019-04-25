class Color < ActiveRecord::Base   
    has_many :genetic_banks
    validates :colorName, presence:{ message:"Obligatory"}, :allow_blank => false, uniqueness: {case_sensitive: false, message:"already exists"} 
end
