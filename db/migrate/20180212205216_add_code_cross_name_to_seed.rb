class AddCodeCrossNameToSeed < ActiveRecord::Migration
    def change
        add_column :seeds, :codeCrossName, :string
    end
end
