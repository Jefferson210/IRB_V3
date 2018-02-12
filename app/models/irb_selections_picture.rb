class IrbSelectionsPicture < ActiveRecord::Base
    belongs_to :irb_selection

    has_attached_file :picture, :path => ":rails_root/public/assets/images/irbSelections/:filename",
    :url => "/assets/images/irbSelections/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
