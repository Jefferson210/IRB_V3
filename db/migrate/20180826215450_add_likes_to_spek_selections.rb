class AddLikesToSpekSelections < ActiveRecord::Migration
    def change
        add_column :spek_selections, :likes, :integer
    end
end
