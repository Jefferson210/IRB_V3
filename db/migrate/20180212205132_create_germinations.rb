class CreateGerminations < ActiveRecord::Migration
    def change
        create_table :germinations do |t|
            t.string :week
            t.integer :numGerminations
            
            t.timestamps null: false
        end
    end
end
