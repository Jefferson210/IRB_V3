class CreateOneOffspringPictures < ActiveRecord::Migration
    def change
        create_table :one_offspring_pictures do |t|
            t.references :one_offspring, index: true, foreign_key: true        
            t.timestamps null: false
        end
    end
end
