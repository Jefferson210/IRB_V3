class AddLikesToIrbSelections < ActiveRecord::Migration
    def change
        add_column :irb_selections, :likes, :integer
    end
end
