class AddPictureToSpekSelectionsPictures < ActiveRecord::Migration
    def change
        add_attachment :spek_selections_pictures, :picture
    end
end
