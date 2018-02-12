class AddPictureToOneOffspringPicture < ActiveRecord::Migration
    def change
        add_attachment :one_offspring_pictures, :picture
    end
end
