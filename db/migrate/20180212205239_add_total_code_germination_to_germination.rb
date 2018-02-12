class AddTotalCodeGerminationToGermination < ActiveRecord::Migration
    def change
        add_column :germinations, :totalCode, :integer
        add_column :germinations, :totalNumRepeat, :integer
    end
end
