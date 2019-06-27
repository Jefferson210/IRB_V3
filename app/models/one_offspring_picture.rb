class OneOffspringPicture < ActiveRecord::Base
    belongs_to :one_offspring

    has_attached_file :picture, styles: { medium: "600x600>", thumb: "300x300>" }, :path => ":rails_root/public/assets/images/oneOffspring/:id/:filename",
    :url => "/assets/images/oneOffspring/:id/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
