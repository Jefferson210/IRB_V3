class CreateGeneticBanks < ActiveRecord::Migration
    def change
        create_table :genetic_banks do |t|
            t.string :code
            t.string :location
            t.string :trademark
            t.string :denomination
            t.date :year
            t.string :breeder
            t.string :status
            t.integer :numPlants
            t.string :scent
            t.string :headSize
            t.integer :numPetals
            t.decimal :steamLenght
            t.string :production
            t.string :opening
            t.text :abnormality
            t.text :remarks

            t.timestamps null: false
        end
    end
end