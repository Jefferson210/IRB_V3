class CreateTwoOffspringPictures < ActiveRecord::Migration
    def change
        create_table :two_offspring_pictures do |t|
            t.references :two_offspring, index: true, foreign_key: true
            
            t.timestamps null: false
        end
    end
end
