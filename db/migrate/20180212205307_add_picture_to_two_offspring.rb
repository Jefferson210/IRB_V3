class AddPictureToTwoOffspring < ActiveRecord::Migration
    def change
        add_attachment :two_offspring_pictures, :picture
    end
end
