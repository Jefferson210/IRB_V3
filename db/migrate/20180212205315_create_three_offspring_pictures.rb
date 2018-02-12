class CreateThreeOffspringPictures < ActiveRecord::Migration
    def change
        create_table :three_offspring_pictures do |t|
            t.references :three_offspring, index: true, foreign_key: true

            t.timestamps null: false
        end
    end
end
