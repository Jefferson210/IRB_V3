class ConectiflorPicture < ActiveRecord::Base
    belongs_to :conectiflor_selection

    has_attached_file :picture, :path => ":rails_root/public/assets/images/conectiflorSelections/:filename",
    :url => "/assets/images/conectiflorSelections/:filename"
    validates :picture, presence:{ message:"Obligatory"}, :allow_blank => false
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
