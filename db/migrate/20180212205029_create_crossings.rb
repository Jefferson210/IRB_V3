class CreateCrossings < ActiveRecord::Migration
    def change
        create_table :crossings do |t|
            t.string :codeCross
            t.string :numOrder
            t.integer :year
            t.string :status
            t.integer :father_id
            t.integer :mother_id
            t.integer :crossWeek
            t.integer :numCrossings
            t.integer :goodCrossings
            t.integer :badCrossings
            t.string :effective
            t.decimal :percentageEffective, precision:5, scale:2
            t.date :dateHarvest
            t.integer :weekHarvest
            t.integer :numSeeds
            t.integer :numRepeat
            
            t.timestamps null: false
        end
    end
end
