class CreateGeneticBankPictures < ActiveRecord::Migration
    def change
        create_table :genetic_bank_pictures do |t|
            t.references :genetic_bank, index: true
            
            t.timestamps null: false
        end
    end
end
