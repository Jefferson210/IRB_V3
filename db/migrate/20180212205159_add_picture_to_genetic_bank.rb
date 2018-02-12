class AddPictureToGeneticBank < ActiveRecord::Migration
    def change
        add_attachment :genetic_bank_pictures, :picture
    end
end
