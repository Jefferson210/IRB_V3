class AddImageIdToIrbSelections < ActiveRecord::Migration
    def change
        add_reference :irb_selections, :irb_selections_picture, index: true, foreign_key: true
    end
end
