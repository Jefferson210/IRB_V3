class SpekSelectionsPicture < ActiveRecord::Base
    belongs_to :spek_selection

    has_attached_file :picture, :path => ":rails_root/public/assets/images/spekSelections/:filename",
    :url => "/assets/images/spekSelections/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
