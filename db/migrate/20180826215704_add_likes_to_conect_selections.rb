class AddLikesToConectSelections < ActiveRecord::Migration
    def change
        add_column :conectiflor_selections, :likes, :integer
    end
end
