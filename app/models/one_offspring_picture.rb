class OneOffspringPicture < ActiveRecord::Base
    belongs_to :one_offspring

    has_attached_file :picture, :path => ":rails_root/public/assets/images/oneOffspring/:filename",
    :url => "/assets/images/oneOffspring/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
