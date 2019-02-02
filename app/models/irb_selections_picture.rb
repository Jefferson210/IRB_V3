class IrbSelectionsPicture < ActiveRecord::Base
    belongs_to :irb_selection
    has_many :irb_selections, dependent: :restrict_with_exception

    has_attached_file :picture, styles: { medium: "600x600>", thumb: "300x300>" }, :path => ":rails_root/public/assets/images/irbSelections/:filename",
    :url => "/assets/images/irbSelections/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
