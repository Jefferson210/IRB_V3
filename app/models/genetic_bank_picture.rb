class GeneticBankPicture < ActiveRecord::Base
    belongs_to :genetic_bank
    
    has_attached_file :picture, styles: { medium: "600x600>", thumb: "300x300>" }, :path => ":rails_root/public/assets/images/geneticBank/:filename",
    :url => "/assets/images/geneticBank/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
