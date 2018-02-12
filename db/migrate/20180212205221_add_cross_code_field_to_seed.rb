class AddCrossCodeFieldToSeed < ActiveRecord::Migration
    def change
        add_column :seeds, :codeCross, :string
    end
end
