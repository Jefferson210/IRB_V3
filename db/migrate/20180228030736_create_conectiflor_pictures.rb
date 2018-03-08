class CreateConectiflorPictures < ActiveRecord::Migration
    def change
        create_table :conectiflor_pictures do |t|
            t.references :conectiflor_selection, index: true, foreign_key: true
            t.timestamps null: false
        end
    end
end
