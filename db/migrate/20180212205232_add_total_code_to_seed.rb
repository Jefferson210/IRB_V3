class AddTotalCodeToSeed < ActiveRecord::Migration
    def change
        add_column :seeds, :totalCode, :integer
        add_column :seeds, :totalNumRepeat, :integer
    end
end
