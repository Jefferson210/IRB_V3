class AddPictureToThreeOffspringPicture < ActiveRecord::Migration
    def change
        add_attachment :three_offspring_pictures, :picture
    end
end
