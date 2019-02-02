class Color < ActiveRecord::Base    
    validates :colorName, presence:{ message:"Obligatory"}, :allow_blank => false, uniqueness: {case_sensitive: false, message:"already exists"} 
end
