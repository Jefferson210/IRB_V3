class AddPictureToIrbSelections < ActiveRecord::Migration
    def change
        add_attachment :irb_selections_pictures, :picture
    end
end
