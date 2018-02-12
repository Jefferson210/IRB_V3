class TwoOffspringPicture < ActiveRecord::Base
    belongs_to :two_offspring

    has_attached_file :picture, :path => ":rails_root/public/assets/images/twoOffspring/:filename",
    :url => "/assets/images/twoOffspring/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
