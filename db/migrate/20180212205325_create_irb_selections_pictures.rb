class CreateIrbSelectionsPictures < ActiveRecord::Migration
    def change
        create_table :irb_selections_pictures do |t|
            t.references :irb_selection, index: true, foreign_key: true

            t.timestamps null: false
        end
    end
end
