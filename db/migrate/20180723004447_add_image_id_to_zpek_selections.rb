class AddImageIdToZpekSelections < ActiveRecord::Migration
    def change
        add_reference :spek_selections, :spek_selections_picture, index: true, foreign_key: true
    end
end
