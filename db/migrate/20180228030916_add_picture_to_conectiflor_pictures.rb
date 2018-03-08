class AddPictureToConectiflorPictures < ActiveRecord::Migration
    def change
        add_attachment :conectiflor_pictures, :picture
    end
end
