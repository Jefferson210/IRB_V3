class AddImageIdToConectiflorSelections < ActiveRecord::Migration
    def change
        add_reference :conectiflor_selections, :conectiflor_picture, index: true, foreign_key: true
    end
end
