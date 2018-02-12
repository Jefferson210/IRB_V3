class DeleteFieldsOfSeed < ActiveRecord::Migration
    def change
        remove_column :seeds, :totalGermination
        remove_column :seeds, :percentageGermination
    end
end
