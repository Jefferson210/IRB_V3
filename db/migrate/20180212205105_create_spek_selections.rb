class CreateSpekSelections < ActiveRecord::Migration
    def change
        create_table :spek_selections do |t|
            t.string :code, null: false, unique: true
            t.string :location
            t.string :trademark
            t.string :denomination
            t.integer :year
            t.string :status
            t.integer :numPlants
            t.references :color, index: true, foreign_key: true
            t.string :scent
            t.string :headSize
            t.integer :numPetals
            t.decimal :steamLenght, precision:5 , scale:2
            t.string :production
            t.string :opening
            t.text :abnormality
            t.text :remarks
            
            t.timestamps null: false
        end
    end
end
