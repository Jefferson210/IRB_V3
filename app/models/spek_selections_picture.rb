class SpekSelectionsPicture < ActiveRecord::Base
    belongs_to :spek_selection
    has_many :spek_selections, dependent: :restrict_with_exception
    has_attached_file :picture, styles: { medium: "600x600>", thumb: "300x300>" },:path => ":rails_root/public/assets/images/spekSelections/:id/:filename",
    :url => "/assets/images/spekSelections/:id/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
