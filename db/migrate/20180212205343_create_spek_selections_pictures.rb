class CreateSpekSelectionsPictures < ActiveRecord::Migration
    def change
        create_table :spek_selections_pictures do |t|
            t.references :spek_selection, index: true, foreign_key: true
            t.timestamps null: false
        end
    end
end
