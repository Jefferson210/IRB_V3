class CreateOneOffsprings < ActiveRecord::Migration
    def change
        create_table :one_offsprings do |t|
            t.integer :individual, null: false
            t.references :color, index: true, foreign_key: true
            t.string :status
            t.decimal :headSize, precision:5 , scale:2
            t.integer :flowering
            t.integer :numPetals
            t.string :form
            
            t.timestamps null: false
        end
    end
end
